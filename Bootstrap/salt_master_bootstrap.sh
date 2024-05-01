#!/bin/bash

# Variable dépôt SaltStack et leurs clés
repo_ubuntu_gpg="https://repo.saltproject.io/salt/py3/ubuntu/$(lsb_release -rs)/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg"
repo_debian_gpg="https://repo.saltproject.io/salt/py3/debian/$(lsb_release -rs)/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg"
salt_archive_keyring="[signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64]"
name_gpg="salt-archive-keyring-2023.gpg"

# Variable pour les couleurs des messages
color_B="\033[1;34m"  # Bleu clair
color_R="\033[1;31m"  # Rouge clair
reset_color="\033[0m"  # Réinitialisation de la couleur

# Fonction pour afficher les messages avec couleur et délai
show_message() {
    echo -e "${color_B}$1${reset_color}"
    sleep 1.5
}

# Fonction pour afficher les messages d'erreur avec couleur et délai
error_message() {
    echo -e "${color_R}$1${reset_color}"
    sleep 1.5
}

# Installer les paquets SaltStack selon la distribution Linux
install_salt_packages() {
    show_message "Vérification de la distribution utilisée..."
    # Déterminer la distribution Linux
    local os_name=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')

    # Vérifier si la distribution est prise en charge
    if [ "$os_name" = "Ubuntu" ]; then
        install_salt_ubuntu
    elif [ "$os_name" = "Debian GNU/Linux" ]; then
        install_salt_debian
    elif [ "$os_name" = "Amazon Linux" ] || [ "$os_name" = "Red Hat Enterprise Linux Server" ]; then
        error_message "La distribution $os_name n'est pas prise en charge par le script !"
        exit 1
    else
        error_message "La distribution $os_name n'est pas prise en charge !"
        exit 1
    fi
}

install_salt_ubuntu() {
    show_message "La distribution Ubuntu est prise en charge..."
    # Ajout du dépôt SaltStack pour Ubuntu
    sudo mkdir -p /etc/apt/keyrings/
    sudo curl -fsSL -o /etc/apt/keyrings/$name_gpg $repo_ubuntu_gpg
    echo "deb $salt_archive_keyring https://repo.saltproject.io/salt/py3/ubuntu/$(lsb_release -rs)/amd64/latest $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/salt.list
    sudo apt update
    show_message "Installation des services Salt : (salt-master salt-minion salt-syndic salt-api) ..."
    sudo apt install -y salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api
}

install_salt_debian() {
    show_message "La distribution Debian est prise en charge..."
    # Ajout du dépôt SaltStack pour Debian
    sudo mkdir -p /etc/apt/keyrings/
    sudo curl -fsSL -o /etc/apt/keyrings/$name_gpg $repo_debian_gpg
    echo "deb $salt_archive_keyring https://repo.saltproject.io/salt/py3/debian/$(lsb_release -rs)/amd64/latest $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/salt.list
    sudo apt update
	show_message "Installation des services Salt : (salt-master salt-minion salt-syndic salt-api salt-ssh salt-cloud) ..."
    sudo apt install -y salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api
}

# Créer et organiser les répertoires pour le Salt-master
create_and_organize_directories() {
    # Création des répertoires s'ils n'existent pas
    if [ ! -d "/srv/salt/base" ] || [ ! -d "/srv/pillar/base" ]; then
        show_message "Les répertoires /srv/salt/base et /srv/pillar/base n'existent pas. Ils vont être créés..."
        sudo mkdir -p /srv/{salt,pillar}/base
    fi

    # Attribution des bonnes permissions aux répertoires
    show_message "Attribution des bonnes permissions aux répertoires..."
    sudo chown -R $(id -un):$(id -gn) /srv/
    sudo chmod 775 -R /srv/

    show_message "Les répertoires ont été créés et organisés avec succès."
}

# Vérifier et mettre à jour la configuration dans le fichier master
configure_salt_master() {
	show_message "Configuration du master..."
    # Demander à l'utilisateur s'il souhaite remplacer le fichier de configuration
    show_message "Voulez-vous remplacer le fichier de configuration du maître Salt par un autre ? (yes/no)" 
	read -p "" reponse
    # Si la réponse est yes, demander le nom du nouveau fichier
    if [ "$reponse" = "yes" ] || [ "$reponse" = "y" ]; then
        fichier_trouve=false
        
        # Tant que le fichier spécifié n'est pas trouvé, continuer à demander le nom du fichier
        while [ "$fichier_trouve" = false ]; do
			show_message "NOTE : Il est recommandé de placer le fichier de configuration dans le même dossier que celui du script actuellement en cours d'exécution."
            show_message "Entrez le nom du nouveau fichier de configuration :"
            read -p "" nouveau_fichier

            # Vérifier si le fichier existe
            if [ -e "$nouveau_fichier" ]; then
				show_message "Vérification du fichier spécifier..."
				show_message "Fichier trouvé !"
                # Remplacer le fichier de configuration par le nouveau fichier
                cp "$nouveau_fichier" /etc/salt/master
                show_message "Le fichier de configuration du maître Salt a été remplacé avec succès."
                fichier_trouve=true
            else
                error_message "Le fichier spécifié n'existe pas. Veuillez spécifier un autre fichier !"
            fi
        done
    else
        show_message "Le fichier de configuration du maître Salt par défaut sera conservé."
    fi
}
	
# Configuration du minion SaltStack
configure_salt_minion() {
	show_message "Configuration du minion..."
    # Demander à l'utilisateur s'il souhaite remplacer le fichier de configuration minion
    show_message "Voulez-vous remplacer le fichier de configuration de base par un autre ? (yes/no)" 
	read -p "" reponse
    # Si la réponse est yes, demander le nom du nouveau fichier
    if [ "$reponse" = "yes" ] || ["$reponse" = "y" ]; then
        fichier_trouve=false
        
        # Tant que le fichier spécifié n'est pas trouvé, continuer à demander le nom du fichier
        while [ "$fichier_trouve" = false ]; do
			show_message "NOTE : Il est recommandé de placer le fichier de configuration dans le même dossier que celui du script actuellement en cours d'exécution."
            show_message "Entrez le nom du nouveau fichier de configuration :"
			read -p "" nouveau_fichier

            # Vérifier si le fichier existe
            if [ -e "$nouveau_fichier" ]; then
				show_message "Vérification du fichier spécifier..."
				show_message "Fichier trouvé !"
                # Remplacer le fichier de configuration par le nouveau fichier
                cp "$nouveau_fichier" /etc/salt/minion
                show_message "Le fichier de configuration a été remplacé avec succès."
                fichier_trouve=true
            else
                error_message "Le fichier spécifié n'existe pas. Veuillez spécifier un autre fichier !"
            fi
        done
    else
        show_message "Le fichier minion par défaut sera conservé."
    fi
}

# Activer et démarrer les services SaltStack
manage_salt_services() {
    show_message "Gestion des services installés..."
    SERVICES=("salt-master" "salt-minion" "salt-syndic" "salt-api")

    start_service() {
        service_name="$1"
        sudo systemctl enable "$service_name" && sudo systemctl start "$service_name"
        show_message "Service $service_name activé et démarré avec succès."
    }

    # Arrêter les services et désactiver leur démarrage automatique au démarrage
    stop_and_disable_services() {
        services=("$@")
        for service in "${services[@]}"; do
            sudo systemctl stop "$service"
            sudo systemctl disable "$service"
            show_message "Service $service arrêté et désactivé pour le démarrage automatique."
        done
    }

    stop_and_disable_services "${SERVICES[@]}"

    # Afficher la liste des services et demander à l'utilisateur de sélectionner ceux qu'il souhaite activé et démarré.
    selected_services=()
    for service in "${SERVICES[@]}"; do
		show_message "Voulez-vous activer et démarrer le service $service ? (yes/no)"
        read -p "" START_SERVICE
        if [ "$START_SERVICE" = "yes" ] || [ "$START_SERVICE" = "y" ]; then
            selected_services+=("$service")
        fi
    done

    # Activé et démarré les services sélectionnés
    for service in "${selected_services[@]}"; do
        start_service "$service"
    done

    # Afficher un message de confirmation
    if [ ${#selected_services[@]} -gt 0 ]; then
        show_message "Les services SaltStack suivants ont été démarrés et activés avec succès : ${selected_services[*]}"
    else
        show_message "Conformément à la demande, les services n'ont pas été activés et démarrés."
    fi
}

# Fonction principale
main() {
    install_salt_packages
    create_and_organize_directories
    configure_salt_master
    configure_salt_minion
    manage_salt_services
}

# Appel de la fonction principale
main

echo -e "\033[1;32mInstallation et configuration du maître Salt terminées.\033[0m"