<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALTSTACK : INTRODUCTION

------------------------------------------------------------------
## Les Fondements de Salt

* Fondements :
  
  * Salt, initié à `Salt Lake City` en `mars 2011`, est un `gestionnaire de configurations` `open-source`.
  * Il est développé en `langage Python`, utilisant des fichiers descriptifs `YAML` pour la configuration.
  * Le templating est réalisé avec `Jinja2` (langage Python) pour dynamiser les configurations.
  * La communication entre les composants se fait via `ZeroMQ`, une file d'attente de messages.
  * Salt propose divers modes de déploiement, adaptés aux besoins spécifiques des utilisateurs.


* Licence Apache - Apache Foundation

------------------------------------------------------------------

## 	L'Architecture de Salt

* Architecture :

  * Salt adopte une architecture `maître/agent`, mais offre également des options comme `salt-ssh` (sans agent) et `masterless`.
  * La communication est facilitée par l'utilisation d'une file d'attente de messages ZeroMQ.
  * Il `combine des aspects d'Ansible et Puppet`, en utilisant un `mode pull principalement` à partir des agents (Minions).
  * La vérification des Minions par le maître et le `chiffrement via des clés AES` garantissent la sécurité et l'intégrité des communications.
  * Salt offre des performances élevées, quelle que soit l'échelle de déploiement.

------------------------------------------------------------------

## Les composants principale de salt

<br>

* Composants principale :
  
  * **Master :** `Le serveur central qui contrôle et coordonne les opérations sur les Minions.`
  * **Minions :** `Les machines distantes` qui exécutent les commandes du Maître.`
  * **Pillars :** `Des données spécifiques à chaque Minion`, partagées de manière sécurisée avec le Maître.`
  * **Grains :** `Informations détaillées sur les Minions collectées par le Maître.`
  * **Formules :** `Ensembles de fichiers YAML décrivant des configurations réutilisables.`
  * **Modules :** `Fonctions exécutables par le Maître sur les Minions.`
  * **State :** `Définition de l'état souhaité des systèmes.`
  * **Mine :** `Stockage de données arbitraires partagées entre les Minions.`
  * **Rôle :** `Assignation de rôles spécifiques à des Minions pour des configurations ciblées.`

------------------------------------------------------------------

## Les Avantages et Inconvénients

* Avantages:

	* **Hautes performances et rapidité :** Salt `excelle dans l'automatisation à grande échelle`, offrant une exécution rapide des tâches.

	* **Gestion étendue de parcs informatiques :** `Adapté pour les infrastructures de toutes tailles`, de petites à très grandes.

	* **Polyvalence :** Utilisable pour la `gestion des réseaux`, `des serveurs`, `des applications`, etc.

	* **Facilité d'installation :** Salt offre une configuration "relativement" simple et un processus d'installation direct.

	* **Divers modes de déploiement :** Possibilité de choisir entre le mode `maître/agent`, `salt-ssh`, et `masterless`.

	* **Prise en charge de langages courants :** Utilisation de `Python` et `YAML`, langages familiers pour de nombreux administrateurs système.

	* **Compatibilité avec différents systèmes d'exploitation :** Fonctionne sur une variété de plates-formes, assurant une flexibilité dans l'utilisation.

* Inconvénients

	* **Multiplicité des concepts :** L'apprentissage peut nécessiter une `compréhension approfondie de nombreux composants`.

	* **Utilisation du templating :** Le templating avec Jinja2 `peut nécessiter une courbe d'apprentissage` pour certains utilisateurs.

	* **Moins couramment utilisé que d'autres outils [IaC](https://www.redhat.com/fr/topics/automation/what-is-infrastructure-as-code-iac) :** Bien que puissant, `SaltStack peut est moins répandu que certains de ses homologues`.

------------------------------------------------------------------

## Les ressources utiles

<br>

* Ressources utiles :
  
  * **CheatSheet :** [SaltStack CheatSheet](https://github.com/eon01/SaltStackCheatSheet)
  * **Documentation :** [Salt Project Documentation](https://docs.saltproject.io/)
  * **Documentation PDF :** [Salt 3006.5 PDF](https://docs.saltproject.io/en/pdf/Salt-3006.5.pdf)
  * **GitHub :** [SaltStack GitHub Repository](https://github.com/saltstack/salt)

------------------------------------------------------------------
