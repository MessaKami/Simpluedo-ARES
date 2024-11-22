# Simpluedo-ARES

## Requête à réaliser sur la BDD

- Lister tous les personnages du jeu 

```sql
SELECT character_name FROM characters;
```
- Lister chaque joueur et son personnage associé

```sql
SELECT user_pseudo, character_name FROM users
INNER JOIN characters ON characters.character_id = users.character_id
```

- Afficher la liste des personnages présents dans la cuisine entre 08:00 et 09:00

```sql
SELECT character_name FROM characters
INNER JOIN characters_rooms ON characters_rooms.character_id = characters.character_id
INNER JOIN rooms ON rooms.room_id = characters_rooms.room_id
WHERE rooms.room_name = 'La cuisine'
AND characters_rooms.arrival_hour BETWEEN ('08:00:00'::TIME) AND ('09:00:00'::TIME);
```

- Afficher les pièces où aucun personnage n'est allé

```sql
SELECT room_name FROM rooms
LEFT JOIN characters_rooms ON characters_rooms.room_id = rooms.room_id
WHERE characters_rooms.character_id  is NULL;
```

- Compter le nombre d'objets par pièce

```sql
SELECT rooms.room_name, COUNT(object_id) FROM objects
INNER JOIN rooms ON rooms.room_id = objects.room_id
GROUP BY rooms.room_name;
```

- Ajouter une pièce

```sql
INSERT INTO rooms (room_name, room_image, room_description) VALUES
('Le garage', 'https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est un garage')
```

- Modifier un objet 

```sql
UPDATE objects
SET object_description='C''est toujours un flingue.'
WHERE object_name = 'Revolver';
```

- Supprimer une pièce 

```sql
DELETE FROM rooms
WHERE room_name = 'Le garage';
```

