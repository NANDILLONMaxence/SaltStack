<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Principales commandes

<br>

## SALT-KEY

<br>

* **Sur le Master**

<br>

* **Management des clefs :**
  * Unaccepted
  * Accepted
  * Rejected
  * Denied

<br>

* **Acceptation/Suppression des Minions**

---------------------------------------------------------------------------

# SALT : Principales commandes

<br>

* **Génération de clef**

<br>

* **Vérification du fingerprint**

<br>

* **-l / -L > List clef pour un ou tous les Minions**

<br>

* **-a / -A > Accepte 1 ou tous les Minions en pending**

<br>

* **-p / -P > Affiche une clef publique**

<br>

* **-d / -D > Supprime une clef ou toutes (attention)**

<br>

* **-f / -F > Affiche un ou les fingerprint**
	
<br>

---------------------------------------------------------------------------

# SALT : Principales commandes

<br>

## SALT

<br>

* **test=true : Dry run**

<br>

* **Spécifier une branche Git (plus tard) :**
  `saltenv=testingBranch pillarenv=testingBranch`

<br>

* **Jouer des modules, fonctions**

<br>

* **Jouer les States**

---------------------------------------------------------------------------

# SALT : Principales commandes

<br>

* **Filtrer les targets :**
  * -E : [Regexp PCRE]()
  * -G : Par grains
  * -C : En combinaison
  * -L : Passer une liste
  * -S : [Sélection sur le CIDR]()

<br>

* **`salt '*' module.fonction args`**

<br>

* **--output :**
  * Raw : En ligne
  * Json : Format JSON
  * Yaml : Format YAML
  * Quiet : Mode silencieux
  * Nested : Par défaut

---------------------------------------------------------------------------

# SALT : Principales commandes

<br>

* **--state-output : Mode d'affichage des States dans l'output :**
  * None : Default
  * Full : Tout
  * Change : Juste les changements
  * ...

<br>

* **--log-file : Où loguer**

<br>

* **--async : Lancement en mode asynchrone**

<br>

* **-b / --batch : Préciser le nombre de Minions par cycle**

---------------------------------------------------------------------------

# SALT : Principales commandes

<br>

* **--return : Où envoyer l'output :**
  * Elasticsearch
  * Couchbase
  * Cassandra
  * Postgresql
  * Sentry
  * Slack
  * SMS...

<br>

* **-t : Préciser un timeout**

<br>

* **--args-separator : Préciser le séparateur d'arguments**

<br>

* **-l : Le log level :**
  * All
  * Debug
  * Info
  * Error
  * Warning (default)

---------------------------------------------------------------------------

# SALT : Principales commandes

<br>

## SALT-CALL

<br>

* **test=true : Dry run**

<br>

* **-g / --grains : Liste de grains (idem grains.items)**

<br>

* **--local : Run local sans Master**

<br>

* **--file-root : Localisation des fichiers de States**

<br>

* **--pillar-root : Localisation des Pillars**

<br>

* **--skip-grains**

<br>

* **--refresh-grains-cache**