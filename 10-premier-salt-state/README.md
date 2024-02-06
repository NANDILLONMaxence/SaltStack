<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Premier SaLt State

<br>

**Salt :**

* **Grains :** Facts d'une machine (variables génériques spécifiques)
* **Pillars :** Variables non génériques dédiées à un contexte
* **State :** Actions dédiées à un but cohérent (application, système...)
* **Formule :** Pillars + States avec un but cohérent d'ensemble

----------------------------------------------------------------------------------------

# SALT : Premier SaLt State

<br>

* **SLS = SaLt State file**
  * Format YAML

* **Attention :**
  * Modules et fonctions spécifiques

```bash
sudo salt 'salt3' sys.list_state_modules
sudo salt 'salt3' sys.list_state_functions pkg
```

**Commentaire :** Ces commandes affichent respectivement les modules et les fonctions spécifiques disponibles pour les états.

<br>

* **Se joue de haut en bas**

<br>

* **file_roots :** Localisation des fichiers SLS

----------------------------------------------------------------------------------------

# SALT : Premier SaLt State

<br>

* **Configuration du file_roots**
  * /etc/salt/master
  * /etc/salt/master.d/file-roots.conf

```yaml
file_roots:
  base:
    - /srv/salt/base
    ...
```

**Notes :**
  * Restart du master
  * Base = environnement par défaut

----------------------------------------------------------------------------------------

# SALT : Premier SaLt State

<br>

* **Déclaration d'un state :** /srv/salt/base/mystate.sls

```yaml
id_state:
  module.fonction:
    paramètre1
    paramètre2:
      - a
      - b
      - c
```

----------------------------------------------------------------------------------------

# SALT : Premier SaLt State

<br>

* **Exemple installation de nginx**

```yaml
installation nginx:
  pkg.installed:
    - name:
      - nginx
```

----------------------------------------------------------------------------------------

# SALT : Premier SaLt State

<br>

* **Jouer le state**

```bash
sudo salt '*' state.show_sls mystate
sudo salt '*' state.sls mystate test=true
sudo salt '*' state.sls mystate
```

**Commentaire :**
  * La première commande affiche le rendu du fichier SLS sans l'appliquer.
  * La deuxième commande effectue un test du state.
  * La troisième commande applique effectivement le state sur tous les Minions.
  ----------------------------------------------------------------------------------------
  