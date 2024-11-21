# Dictionnaire de données

Ici les types données sont déjà véritablement précisés parce que nous savons déjà en amont que notre système de gestion de base de données sera PostgreSQL.

| Nom de la colonne        | Description                                    | Type de données  | 
|--------------------------|------------------------------------------------|------------------|
| user_UUID                | Identifiant unique de l'utilisateur            | UUID             |
| user_pseudo              | Pseudo de l'utilisateur                        | VARCHAR(15)      |
| role_id                  | Identifiant unique du rôle                     | INTEGER          |
| role_name                | Rôle attribué à un utilisateur pour la partie  | VARCHAR(15)      |
| character_id             | Identifiant du personnage                      | SERIAL           |
| character_name           | Nom du personnage                              | VARCHAR(20)      |
| character_color          | Couleur du personnage en format hexadécimal    | VARCHAR(7)       |
| character_image          | Liens vers l'illustration du personnage        | VARCHAR(300)     |
| character_description    | Lore du personnage                             | VARCHAR(400)     |
| room_id                  | Identifiant de la salle                        | SERIAL           |
| room_name                | Nom de la salle                                | VARCHAR(20)      |
| room_image               | Liens vers l'illustration de la salle          | VARCHAR(300)     |
| room_description         | Description de la salle                        | VARCHAR(400)     |
| object_id                | Identifiant de l'objet                         | SERIAL           |
| object_name              | Nom de l'objet                                 | VARCHAR(20)      |
| object_description       | Description de l'objet                         | VARCHAR(400)     |
| object_image             | Liens vers l'illustration de l'objet           | VARCHAR(300)     |
| arrival_hour             | Heure d'arrivée d'un personnage dans une salle | TIME             |
| departure_hour           | Heure de départ  d'une salle d'un personnage   | TIME             |