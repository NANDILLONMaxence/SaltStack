<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Pillars

<br>

**Salt :**

* **Grains :** Facts d'une machine (variables génériques spécifiques)
* **Pillars :** Variables non génériques dédiées à un contexte
* **State :** Actions dédiées à un but cohérent (application, système...)
* **Formule :** Pillars + States avec un but cohérent d'ensemble

------------------------------------------------------------------

# SALT : Pillars

<br>

* **Variables spécifiques à une ou des machines**
* **Définition et configuration de modules d'exécution de minions**
* **Données sensibles :** Les données sont fournies uniquement aux minions ciblés
* **Données arbitraires :** Des données communes à des groupes, etc.

------------------------------------------------------------------

# SALT : Pillars

<br>

* **Configuration de la localisation de l'arborescence des pillars**

Sur le master

```bash
sudo vim /etc/salt/master
```

Et restart du master

```bash
sudo systemctl restart salt-master
```

------------------------------------------------------------------

# SALT : Pillars

<br>

* **Création du répertoire d'environnement (base par défaut)**

```bash
sudo mkdir -p /srv/pillar/base
```

**Remarque :** Doit correspondre aux répertoires des states

<br>

* **Création du fichier top.sls**

```bash
cat /srv/pillar/top.sls 
base:
  'salt4':
  - mypillar
```

**Remarque :** Patterns utilisables (simple, composé...)

------------------------------------------------------------------

# SALT : Pillars

<br>

* **Premier pillar**

```bash
sudo mkdir -p /srv/pillar/mypillar/

cat /srv/pillar/mypillar/init.sls 
mypillar:
  myvar: "je suis salt4 !!"
```

**Remarque :** Par convention, la première clé est du nom du pillar

<br>

* **Refresh des pillars**

```bash
sudo salt '*' saltutil.refresh_pillar
```

------------------------------------------------------------------

# SALT : Pillars

<br>

* **Utilisation d'un pillar**

```bash
mkdir -p /srv/salt/base/mypillar/

cat base/mypillar/init.sls 
Add line toto.txt:
   file.managed:
    - name: /tmp/toto.txt
    - contents:
      - {{ pillar["mypillar"]["myvar"] }}
```