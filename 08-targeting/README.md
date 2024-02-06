<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Targeting

<br>

## Commande : SALT

**Objectif : Comment cibler des serveurs si nécessaire ?**

<br>

* **Filtrer les targets dans les Minions :**
  * Glob
  * -E : [Regexp PCRE]()
  * -G : Par grains
  * -C : En combinaison
  * -L : Passer une liste
  * -S : [Sélection sur le CIDR]()

-------------------------------------------------------------------------------

# SALT : Targeting

<br>

## GLOB

* **Faire tourner sur tous les Minions**

```bash
sudo salt '*' test.ping
```

**Commentaire :** La commande `test.ping` sera exécutée sur tous les Minions.

<br>

* **Avec un ou plusieurs caractères manquants**

```bash
sudo salt 's*lt*' test.ping
```

**Commentaire :** Cela cible tous les Minions dont le nom contient "s", suivi de n'importe quel nombre de caractères, suivi de "lt".

<br>

* **Ou avec une liste de caractères précis**

```bash
sudo salt 's[a-z]lt*' test.ping
```

**Commentaire :** Cette fois-ci, la cible est définie par la première lettre "s", suivie de n'importe quelle lettre entre "a" et "z", puis "lt".

-------------------------------------------------------------------------------

# SALT : Targeting

<br>

## REGEXP (Perl Compatible Regular Expression - PCRE)

* **Contenant des caractères**

```bash
sudo salt 'sa' test.ping
sudo salt -E 'sa' test.ping
```

**Commentaire :** Les deux commandes font la même chose, ciblant les Minions dont le nom contient "sa".

<br>

* **La wildcard**

```bash
sudo salt -E '*' test.ping
sudo salt -E '.*' test.ping
```

**Commentaire :** Ces deux commandes ciblent tous les Minions.

-------------------------------------------------------------------------------

# SALT : Targeting

<br>

* **Énumérer**

```bash
sudo salt -E '[a-z]{4}[0-2]' test.ping
```

**Commentaire :** Cela cible les Minions dont le nom est une séquence de quatre lettres, suivie d'un chiffre de 0 à 2.

<br>

* **Fin de ligne**

```bash
sudo salt -E '.*[0-2]$' test.ping
```

**Commentaire :** Cela cible les Minions dont le nom se termine par un chiffre de 0 à 2.

* **Début de ligne**

```bash
sudo salt -E '^s.*[0-2]$' test.ping
```

**Commentaire :** Cela cible les Minions dont le nom commence par "s" et se termine par un chiffre de 0 à 2.

* **Ou**

```bash
sudo salt -E '.*(1|4)' test.ping
```

**Commentaire :** Cela cible les Minions dont le nom contient "1" ou "4".

-------------------------------------------------------------------------------

# SALT : Targeting

<br>

## LIST

* **Simple liste**

```bash
sudo salt -L 'salt1,salt3' test.ping
```

**Commentaire :** Cela cible les Minions "salt1" et "salt3".

-------------------------------------------------------------------------------

# SALT : Targeting

<br>

## GRAINS

* **Liste de grains**

```bash
sudo salt '*' grains.items
sudo salt '*' grains.item nodename
```

**Commentaire :** Les deux commandes affichent les grains pour tous les Minions, puis spécifiquement le grain "nodename".

<br>

* **Application d'un filtre**

```bash
sudo salt -G 'nodename:salt1' cmd.run hostname
```

**Commentaire :** Cela cible le Minion dont le grain "nodename" est égal à "salt1".

<br>

* **Filtre incluant du Glob**

```bash
sudo salt -G 'nodename:salt*' cmd.run hostname
sudo salt -G 'nodename:salt[0-2]' cmd.run hostname
```

**Commentaire :** Les deux commandes ciblent les Minions dont le grain "nodename" correspond à "salt*" (n'importe quelle suite de caractères) ou "salt[0-2]" (de 0 à 2 inclus).

-------------------------------------------------------------------------------

# SALT : Targeting

<br>

## COMPOUND

* **Simple ET**

```bash
sudo salt -C 'G@oscodename:focal and E@salt[0-2]' cmd.run hostname
```

**Commentaire :** Cela cible les Minions avec un grain "oscodename" égal à "focal" ET dont le nom est inclus dans "salt[0-2]".

<br>

* **Avec négation NOT et OU**

```bash
sudo salt -C 'G@nodename:salt4 or not E@salt[0-2]' cmd.run hostname
```

**Commentaire :** Cela cible les Minions dont le grain "nodename" est égal à "salt4" OU qui ne sont pas inclus dans "salt[0-2]".

-------------------------------------------------------------------------------
