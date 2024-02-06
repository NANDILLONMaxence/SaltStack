<!-- Titre: Introduction à Saltstacks -->
<!-- auteur: Xavki https://gitlab.com/xavki -->
<!-- repris par madmax https://github.com/NANDILLONMaxence -->

# SALT : Première boucle for

<br>

* **Salt > Python > Jinja**

<br>

* **Pillar = souvent des dictionnaires à parcourir**

<br>

**Exemple précédent**

-------------------------------------------------------------------

# SALT : Première boucle for

<br>

* Modification de notre state

```yaml
{% for user_name, user_params in pillar['users'].items() %}
  Create user {{ user_name }}:
    user.present:
      - name: {{ user_name }}
      - password: {{ user_params.password }}
      - uid: {{ user_params.uid }}
{% endfor %}
```
