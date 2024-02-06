<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Modules & Fonctions

<br>

* **Ping**

```bash
sudo salt '*' test.ping
```

Note :

		* `test` > module
		* `ping` > fonction du module `test`

--------------------------------------------------------------

# SALT : Modules & Fonctions

<br>

* **Liste des modules**

```bash
sudo salt '*' sys.list_modules
```

<br>

* **Liste des fonctions**

```bash
sudo salt '*' sys.list_functions
sudo salt '*' sys.list_functions test
```

--------------------------------------------------------------

# SALT : Modules & Fonctions

<br>

* **Documentation**

```bash
sudo salt '*' sys.doc test
sudo salt '*' sys.doc test.ping
```

```bash
sudo salt '*' sys.list_modules | grep pkg
```

--------------------------------------------------------------

# SALT : Modules & Fonctions

<br>

* **Installation de paquets**

```bash
sudo salt '*' sys.doc pkg.install
```

```bash
sudo salt '*' pkg.install nginx
```

<br>

* **Stop/Start...**

```bash
sudo salt '*' sys.doc service
```
-------------------------------------------------------------------------
