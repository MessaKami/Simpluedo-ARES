# Simpluedo-ARES

## Requête à réaliser sur la BDD

```sql
SELECT * FROM objects
INNER JOIN rooms ON rooms.room_id = objects.room_id
WHERE rooms.room_name = 'La cuisine';
````

