<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# INSTALLATION : MASTER

<br>

## ARCHITECTURE

La documentation complète sur l'architecture du système Salt est disponible à [ce lien](https://docs.saltproject.io/en/latest/topics/salt_system_architecture.html).
<img src=https://docs.saltproject.io/en/latest/images/salt-architecture.png width="100%" />

<br>

## INSTALLATION

<br>

### Plusieurs types d'installations

* **Python avec pip :** L'installation de Salt peut être effectuée via Python et pip.

* **Shell de Bootstrap :** Salt propose un [script de bootstrap](https://github.com/saltstack/salt-bootstrap) pour simplifier le processus d'installation.

* **Installation du [dépôt](https://repo.saltproject.io/#directory-listing) et gestionnaire de paquets :** Une méthode consiste à ajouter le dépôt SaltStack et utiliser le gestionnaire de paquets du système.

-------------------------------------------------------------------------

# INSTALLATION : MASTER

<br>

## Installation via APT

* **Guide d'installation :** Les instructions d'installation spécifiques sont disponibles [ici](https://docs.saltproject.io/salt/install-guide/en/latest/).

-------------------------------------------------------------------------

# INSTALLATION : MASTER

<br>

* **Installation du dépôt SaltStack**

##### Exemple: Ubuntu 20.04
```bash
wget -qO - https://repo.saltproject.io/py3/ubuntu/20.04/amd64/latest/salt-archive-keyring.gpg | sudo apt-key add -
echo "deb https://repo.saltproject.io/py3/ubuntu/20.04/amd64/latest focal main" | sudo tee /etc/apt/sources.list.d/salt.list
```

<br>

* **Installation des paquets**

```bash
sudo apt -y install salt-api salt-cloud salt-master salt-minion salt-ssh salt-syndic
```

Notes :
  * Ports à considérer : `4505` et `4506`

-------------------------------------------------------------------------

# INSTALLATION : MASTER

<br>

## Réglages minimaux et test en local

### Sur le Master

* **Adresse IP d'écoute :** Configurez l'interface dans `/etc/salt/master`.

### Sur le Minion

* **Nom du Salt Master (DNS) :** Configurez le nom du Salt Master dans `/etc/salt/minion`.

* **Nom du Minion :** Définissez le nom du Minion dans `/etc/salt/minion_id`.

```bash
sudo systemctl restart salt-master
sudo systemctl restart salt-minion
```

-------------------------------------------------------------------------

# INSTALLATION : MASTER

<br>

* **Vérification des [fingerprints](https://www.cnil.fr/fr/definition/fingerprinting#:~:text=Le%20fingerprinting%2C%20ou%20%C2%AB%20prise%20d,caract%C3%A9ristiques%20techniques%20de%20son%20navigateur.)**

```bash
sudo salt-key -F salt1  # pour le master
sudo salt-call --local key.finger
```

<br>

* **Liste des clés à accepter**

```bash
sudo salt-key -L
```

<br>

* **Acceptation d'une clé**

```bash
sudo salt-key -a salt1
```

<br>

* **Ping**

```bash
sudo salt 'salt1' test.ping
sudo salt '*' test.ping
```

<br>

##### Autre commande:

<br>

* **Mise en attente d'une clé (Pending)**

```bash
sudo salt-key -p -n <nom_du_minion_ou_ip>
```

<br>

* **Refus d'une clé**

```bash
sudo salt-key -d <nom_du_minion_ou_ip>
```
-------------------------------------------------------------------------
