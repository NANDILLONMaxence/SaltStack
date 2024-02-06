<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Définitions & Concepts

<br>

## MASTER

* **Serveur Central :** Le Master est le serveur central de Salt, responsable de la coordination et du contrôle des Minions.
* **Commande `salt-master` :** Utilisée pour démarrer le service Salt Master.
* **Multi-Master possible (Haute Disponibilité) :** Salt offre la possibilité d'avoir plusieurs Masters en parallèle, assurant une haute disponibilité.
* **Serveur portant la queue ZeroMQ :** La communication entre le Master et les Minions se fait via ZeroMQ, avec le Master servant de serveur portant la queue.
* **`salt-syndic` :** Un Master intermédiaire entre le Master principal et les agents (Minions), permettant une configuration plus complexe.

------------------------------------------------------------------------------------

# SALT : Définitions & Concepts

<br>

## MINIONS

* **Agents :** Les Minions sont les agents installés sur chaque machine distante à gérer.
* **Commande `salt-minion` :** Utilisée pour démarrer le service Salt Minion.
* **Référence à un Master (ou non) :** Chaque Minion fait référence à un Master auquel il se connecte pour recevoir des commandes.
* **Va chercher les informations sur le Master (queue) :** Les Minions récupèrent les informations du Master en utilisant la file d'attente (queue) ZeroMQ.
* **Masterless possible :** Possibilité d'exécuter Salt sans Master, en mode masterless.
* **`salt-proxy` :** Utilisé pour gérer spécifiquement des appareils réseau tels que des routeurs.

------------------------------------------------------------------------------------

# SALT : Définitions & Concepts

<br>

## PILLARS

* **Équivalent des variables d'inventaires (Ansible) :** Les Pillars sont comparables aux variables d'inventaires dans Ansible.
* **Variables spécifiques à des machines ou groupes de machines :** Ces variables sont définies spécifiquement pour des machines individuelles ou des groupes de machines.

<br>

## GRAINS

* **Équivalent de `gather_facts` (Ansible) :** Les Grains sont similaires à la collecte de faits (`gather_facts`) dans Ansible.
* **Standards ou customs :** Les informations peuvent être standards (comme le système d'exploitation) ou personnalisées (comme des détails spécifiques à l'environnement).

------------------------------------------------------------------------------------

# SALT : Définitions & Concepts

<br>

## STATES

* **SLS : SaLt State File :** Un fichier regroupant une ou plusieurs actions à réaliser, utilisant des modules ou fonctions Salt.
* **Format YAML et extension `.sls` :** Les fichiers SLS sont écrits en YAML et ont une extension `.sls`.
* **Une action/application d'un module avec des paramètres spécifiques :** Définit une tâche à effectuer sur un Minion.
* **Une action dispose d'un ID (décrivant la tâche réalisée) :** Chaque action a un identifiant pour la traçabilité.
* **Highstate :** L'exécution de l'ensemble des States sur un Minion.
* **`TOP.sls` :** Un fichier décrivant quelles machines reçoivent quels States (actions).

------------------------------------------------------------------------------------

# SALT : Définitions & Concepts

<br>

## SALT-MINE

* **Stockage de données des Minions sur les Masters :** Le Salt-Mine est un espace de stockage des données provenant des Minions, accessible depuis les Masters.
* **Utilisable via le module `salt.modules.mine` :** Les données peuvent être exploitées par les Masters via le module `salt.modules.mine`.

<br>

## REACTOR

* **Permet de réaliser des actions suite à des évènements :** Le Reactor offre la possibilité d'effectuer des actions en réaction à des événements spécifiques.
* **Event Driven :** Fonctionne sur le principe de l'événement déclencheur.

<br>

## BEACON

* **Monitorer des processus (services, etc.) :** Les Beacons sont utilisés pour surveiller des processus tels que des services.
* **Éventuellement déclencher des actions (scaling, autorestart, etc.) :** En fonction des conditions définies, les Beacons peuvent déclencher des actions telles que le redimensionnement ou le redémarrage automatique.