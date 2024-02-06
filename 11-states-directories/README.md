<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : State & directories

<br>

**Salt :**

* **Grains :** Facts d'une machine (variables génériques spécifiques)
* **Pillars :** Variables non génériques dédiées à un contexte
* **State :** Actions dédiées à un but cohérent (application, système...)
* **Formule :** Pillars + States avec un but cohérent d'ensemble

------------------------------------------------------------------

# SALT : State & directories

<br>

* **Premier pas : Création d'un répertoire**

```bash
vagrant@salt1:/srv/salt/base$ tree
.
└── nginx
    └── init.sls
```

**Note :**
  * `init.sls` > Point d'entrée (cf Ansible main.yml)

------------------------------------------------------------------

# SALT : State & directories

<br>

* **Ajout d'une autre action**

```yaml
manage default index:
  file.managed:
    - name: /var/www/html/index.nginx-debian.html
    - contents: |
        Hello Xavki !!
        Bye :)
```

------------------------------------------------------------------

# SALT : State & directories

<br>

* **Si beaucoup d'actions à réaliser = Split en fichiers cohérents**

```bash
vagrant@salt1:/srv/salt/base$ tree
.
└── nginx
    ├── files.sls
    ├── init.sls
    └── nginx.sls
```

------------------------------------------------------------------

# SALT : State & directories

<br>

* **Fichier init composé d'includes**

```yaml
include:
  - nginx.nginx
  - nginx.files
```

