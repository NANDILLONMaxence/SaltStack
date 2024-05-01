# Bootstrap maison pour l'installation et la configuration d'un serveur Salt Master

Cette partie contient un script personnalisé conçu pour faciliter l'installation et la configuration d'un serveur Salt Master. Le script prend en charge différentes distributions Linux et permet de mettre en place rapidement un environnement prêt à l'emploi pour la gestion de configuration avec SaltStack.

## Utilisation

1. Clonez ce dépôt sur votre serveur :
   ```
   git clone https://github.com/NANDILLONMaxence/SaltStack/tree/main/Bootstrap
   ```

2. Accédez au répertoire du dépôt :
   ```
   cd salt-master-bootstrap
   ```

3. Assurez-vous que le script est exécutable :
   ```
   chmod +x salt_master_bootstrap.sh
   ```

4. Exécutez le script en tant qu'administrateur :
   ```
   sudo ./salt_master_bootstrap.sh
   ```

5. Suivez les instructions à l'écran pour configurer votre serveur Salt Master.

## Prérequis

- Accès administrateur sur le serveur
- Système d'exploitation Linux (Ubuntu, Debian, etc.)

| OS           | Supported          |
| ------------ | ------------------ |
| Ubuntu       | :white_check_mark: |
| Debian       |        ❔          |
| CentOS       |        ❔          |
| Amazon       |        :x:         |
| Red Hat      |        :x:         |

## Fonctionnalités

- Installation automatisée de Salt Master
- Personnalisation de la configuration du serveur Salt Master en intégrant vos propres fichiers de configuration pour le Master et/ou le Minion, ou configuration de base.
   * Placez vos fichiers de configuration pour le Master et/ou le Minion dans le même répertoire que le script bootstrap, puis suivez les instructions en exécutant le script.
- Prise en charge de plusieurs distributions Linux

## Contributions

Les contributions sous forme de suggestions, d'améliorations et de correctifs sont les bienvenues. N'hésitez pas à ouvrir une issue ou à soumettre une pull request.

---
