Le mode maître/agent de SaltStack implique une architecture où il y a un serveur maître (master) et des machines distantes, appelées Minions, qui exécutent un agent Salt. Voici une explication plus détaillée :

**Maître/Agent :**

- **Maître (Master) :**
  - Le serveur central responsable de la coordination et de la gestion de l'infrastructure.
  - Reçoit les commandes, les configurations et les états à partir du maître.
  - Propage les commandes aux Minions pour exécution.

- **Minion (Agent) :**
  - Les machines distantes qui exécutent un agent Salt.
  - Communiquent avec le maître pour recevoir des ordres et envoyer des rapports d'état.
  - Exécutent les commandes et configurations reçues du maître.

**Fonctionnement :**

1. **Inscription des Minions :**
   - Les Minions s'inscrivent auprès du maître en envoyant leur clé publique.
   - Le maître approuve les clés des Minions, établissant ainsi une relation de confiance.

2. **Communication :**
   - Le maître envoie des commandes, des configurations ou des états aux Minions.
   - Les Minions exécutent les tâches et envoient des rapports d'état au maître.

3. **Orchestration :**
   - Le maître peut orchestrer des tâches sur plusieurs Minions simultanément.
   - Les Minions répondent aux commandes et retournent les résultats au maître.

**Avantages :**

- **Centralisation :**
  - Gestion centralisée des configurations, des états et des commandes.

- **Sécurité :**
  - Utilisation de clés pour authentifier et sécuriser les communications.

- **Performance :**
  - Performant à grande échelle, avec un mode pull pour optimiser les performances.

**Inconvénients :**

- **Dépendance :**
  - Nécessite l'installation et la configuration de l'agent Salt sur chaque Minion.

- **Complexité initiale :**
  - Peut nécessiter une configuration initiale pour établir la communication sécurisée entre le maître et les Minions.

Le mode maître/agent est adapté aux environnements où une gestion centralisée des configurations et des tâches automatisées est essentielle, et où l'installation d'un agent sur les machines distantes est acceptable.