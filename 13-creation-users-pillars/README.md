<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Création d'utilisateurs et de groupes

<br>

**Documentations :**
[Group State Module](https://docs.saltproject.io/en/latest/ref/states/all/salt.states.group.html)
[User State Module](https://docs.saltproject.io/en/latest/ref/states/all/salt.states.user.html)

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

<br>

**MODULE : GROUP**

```bash
sudo salt 'salt4' sys.list_state_modules
sudo salt 'salt4' sys.list_state_functions group
```

```yaml
salt4:
    - group.absent
    - group.present
```

```bash
sudo salt 'salt4' sys.state_doc group
```

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

**GROUP.PRESENT :**

* **name (str):** Nom du groupe
* **gid (str):** Créer un GID spécifique
* **system (bool):** Créer un groupe de type system
* **addusers (list):** Ajouter une liste d'utilisateurs dès la création du groupe
* **delusers (list):** S'assurer que des utilisateurs ne sont pas présents dans ce groupe
* **members (list):** Remplacer complètement la liste des utilisateurs du groupe

**GROUP.ABSENT :**

* **name (str):** Nom du groupe

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

* **Simple création du groupe xavki :**

```yaml
xavki:
  group.present:
    - gid: 2000
    - addusers:
      - vagrant
```

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

```yaml
salt4:
    - user.absent
    - user.present
```

**USER.ABSENT :**

* **name:** Nom de l'utilisateur
* **purge:** Supprimer tous les fichiers de l'utilisateur
* **force:** Supprimer un utilisateur avec une session ouverte

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

<br>

**USER.PRESENT**

* **name:** Nom de l'utilisateur
* **uid:** UID prédéfini
* **gid:** Association à un groupe par le GID ou le nom du groupe
* **allow_uid_change:** Permettre la modification de l'UID à salt
* **allow_gid_change:** Idem pour le GID
* **usergroup:** Permettre la création d'un groupe du même nom
* **groups (list):** Ajouter l'utilisateur à des groupes (si vide, supprime de tous, sauf default)
* **optional_groups:** Groupes non obligatoires (pas de fail si absent)

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

**USER.PRESENT**

* **remove_groups:** Supprime les groupes dont l'utilisateur est membre
* **home:** Définir la home de l'utilisateur (créé par défaut)
* **createhome (true):** Créé la home par défaut si elle n'existe pas
* **nologinit (false):** N'ajoute pas l'utilisateur à lastlog et faillog
* **password:** Hash du mot de passe
* **hash_password (false):** Permet de rentrer un mot de passe non hashé
* **enforce_password (true):** Empêche de changer le mot de passe si il diffère du hash 
* **empty_password (false):** Autoriser le sans mot de passe
* **shell:** Le shell utilisé par défaut par l'utilisateur

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

**USER.PRESENT**

* **unique (true):** Avoir un UID unique
* **system:** Utilisation d'un UID system ou non
* **date:** Date de dernier changement de mot de passe (epoch)
* **mindays:** Minimum de jours pour le changement de mot de passe
* **maxdays:** Maximum de jours pour le changement de mot de passe
* **inactdays:** Maximum de jours après expiration du mot de passe et avant le lock du compte
* **warndays:** Nombre de jours pour prévenir avant le maxdays
* **expire:** Date d'expiration du compte (en jours depuis epoch - 01/01/1970)

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

<br>

* **Utilisation du pillar pour stocker nos utilisateurs (sans boucle pour le moment)**

```yaml
mkdir -p /srv/pillar/base/users/

cat /srv/pillar/base/users/init.sls

users:
  xavki:
    name: xavki
    password: $6$...
    uid: 2000
  xavier:
    name: xavier
    password: $6$...
    uid: 2001
```

-----------------------------------------------------------------------------------------------

# SALT : Création d'utilisateurs et de groupes

<br>

* **Création du state**

```yaml
mkdir -p /srv/salt/base/users/

cat /srv/salt/base/users/init.sls

Create user xavki:
  user.present:
    - name: {{ pillar['users']['xavki']['name']}}
    - password: {{ pillar['users']['xavki']['password'] }}
    - shell: /bin/bash
    - home: /home/xavki
    - uid: {{ pillar['users']['xavki']['uid'] }}
   

 - gid: 2000
    - groups:
      - sudo
      - vagrant
```