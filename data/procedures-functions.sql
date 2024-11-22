-- Création d'une fonction permettant de retourner la liste des objets présents dans une pièce placée en paramètre

CREATE OR REPLACE FUNCTION retrieve_room_objects(roomName VARCHAR)
 RETURNS TABLE(object_name VARCHAR)
 LANGUAGE sql
 AS $$
     SELECT objects.object_name
     FROM objects
     INNER JOIN rooms ON rooms.room_id = objects.room_id
     WHERE rooms.room_name = roomName;
 $$;

 -- Appel pour tester la fonction 

 SELECT * FROM retrieve_room_objects('La cuisine');

 -- Création d'une procédure permettant d'ajouter un nouvel objet avec son nom, sa description, son image et sa pièce d'affiliation placés en paramètres

 CREATE PROCEDURE add_room_object (objectName VARCHAR, objectDescription VARCHAR, objectImage VARCHAR, roomId INTEGER)
  LANGUAGE sql
  AS $$
    INSERT INTO objects (object_name, object_description, object_image, room_id) VALUES
    (objectName, objectDescription, objectImage, roomId);
 $$; 

 -- Appel pour tester la procèdure

 CALL add_room_object('La banane', 'C''est une banane', 'http://image.com', 2);