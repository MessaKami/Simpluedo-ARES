-- Création du futur propriétaire de la base de données après s'être connecté en tant que postgres
CREATE ROLE colonel_moutarde WITH CREATEDB CREATEROLE LOGIN PASSWORD 'danslacuisineaveclechandelier';

-- Création de la base de données, toujours connecté en tant que postgres et attribution
CREATE DATABASE simpluedo OWNER colonel_moutarde;

-- ensuite se déconnecter de psql et du super admin pour se connecter à pgcli
pgcli -h localhost -U colonel_moutarde -d simpluedo

-- entrer le mot de passe de colonel_moutarde

-- Ensuite créer des tables

-- avant de créer les tables, installer l'extension uuid-ossp si non installé
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- La table des rôles
CREATE TABLE roles
 (
 role_id SERIAL PRIMARY KEY,
 role_name VARCHAR(15) NOT NULL
 ); 

--  table des personnages
 CREATE TABLE characters
 (
 character_id SERIAL PRIMARY KEY,
 character_name VARCHAR(20) NOT NULL,
 character_color VARCHAR(7) NOT NULL,
 character_image VARCHAR(300) NOT NULL,
 character_description VARCHAR(400) NOT NULL
 );

--  Table des utilisateurs
CREATE TABLE users
 (
 user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
 user_pseudo VARCHAR(15) NOT NULL,
 role_id INTEGER REFERENCES roles(role_id),
 character_id INTEGER REFERENCES characters(character_id)
 );

-- table des salles
CREATE TABLE rooms
 (
 room_id SERIAL PRIMARY KEY,
 room_name VARCHAR(20) NOT NULL,
 room_image VARCHAR(300) NOT NULL,
 room_description VARCHAR(400) NOT NULL
 );

-- tables des objets
CREATE TABLE objects
 (
 object_id SERIAL PRIMARY KEY,
 object_name VARCHAR(20) NOT NULL,
 object_image VARCHAR(300) NOT NULL,
 object_description VARCHAR(400) NOT NULL,
 room_id INTEGER REFERENCES rooms(room_id)
 );

-- table des visites
 CREATE TABLE characters_rooms
 (
 arrival_hour TIME NOT NULL,
 departure_hour TIME,
 character_id INTEGER REFERENCES characters(character_id),
 room_id INTEGER REFERENCES rooms(room_id)
 );

-- Création de l'admin de la base de données après s'être connecté en tant que super admin
CREATE ROLE admin_simpluedo LOGIN PASSWORD 'danslesalonaveclacorde';
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO admin_simpluedo;
GRANT USAGE, SELECT ON SEQUENCE roles_role_id_seq, characters_character_id_seq, rooms_room_id_seq, objects_object_id_seq TO admin_simpluedo;


-- A présent on se déconnecte du super admin pour switcher sur l'admin

-- Puis rajouter les données dans les tables
INSERT INTO roles (role_name) VALUES
 ('maitre_du_jeu'),
 ('detective'),
 ('observateur');


 INSERT INTO characters (character_name, character_color, character_image, character_description) VALUES
 ('Mademoiselle Rose', '#a52a2a','https://static.wikia.nocookie.net/cluedo/images/e/e1/05-21---Miss-Scarlett.jpg/revis
 ion/latest?cb=20171015125800&path-prefix=fr','Mademoiselle Rose âgée de 25 ans, d''origine Française et Italienne est
  une actrice dans l''âme, de grande notoriété elle est venue rejoindre sa mère, Madame Pervenche au Manoir, avec qui 
 elle ne s''entend pas pour fuir les tabloïds.'),
 ('Colonel Moutarde','#ffbf4f','https://static.wikia.nocookie.net/cluedo/images/f/f7/05-22---Colonel-Mustard.jpg/revis
 ion/latest?cb=20171015125500&path-prefix=fr','Colonel Moutarde, veille connaissance de Charles Édouard, a ses habitud
 es au Manoir, dans lequel il passe de nombreux week-ends. Le Docteur Lenoir, neveu de Charles Édouard compte parmi se
 s amis. Après avoir tenté de faire carrière dans l''armée, il s''est persuadé d''être un héros militaire.'),
 ('Docteur Orchidée','#ce5e6f','https://static.wikia.nocookie.net/cluedo/images/e/eb/05-23---Miss-Orchid.jpg/revision/
 latest?cb=20171017115616&path-prefix=fr','Le Docteur Orchidée est la fille adoptive du Dr Lenoir. Adoptée à l''adoles
 cence, Dr Orchidée fit ses études en Suisse, avant d''être expulsée par son établissement à cause d''un empoissonneme
 nt accidentel de sa part... Elle est surdouée.'),
 ('Révérand Olive', '#8ba888','https://static.wikia.nocookie.net/cluedo/images/d/db/05-24---Rev-Green.jpg/revision/lat
 est?cb=20171017113209&path-prefix=fr','Olive est décrit comme quelqu''un qui vit dans la société mondaine réussissant
  à obtenir des invitations pour n''importe quelle soirée V.I.P. Cela traduit qu''il a des contacts et qu''il est mali
 n. Toutefois, on sait qu''il baigne également dans d''étranges affaires si on lui demande un service.'),
 ('Madame Pervenche','#415e9a','https://static.wikia.nocookie.net/cluedo/images/7/75/C8QfsioWsAAv_L5.jpg/revision/late
 st?cb=20171016164322&path-prefix=fr','Madame Pervenche, de son vrai nom Éléonore Fleur, est une politicienne réputée.
  Madame Pervenche est une femme déterminée. Elle aime briller en société et est engagée dans toutes sortes de causes 
 qui lui permettent d''être sous le feu des projecteurs.'),
 ('Professeur Violet','#7214c8','https://static.wikia.nocookie.net/cluedo/images/0/06/05-26---Professor-Plum.jpg/revis
 ion/latest?cb=20171015130240&path-prefix=fr','Après avoir terminé ses études à l''école de philosophique d''Alexandri
 e, il est parti en voyage dans des pays exotiques avec sa femme, Mlle Annette. Cependant, celui ci se délaissa rapide
 ment de la compagnie de sa bien-aimée au profit d''une toute nouvelle venue : la jeune et charmante Mlle Rose.');

INSERT INTO objects (object_name, object_image, object_description, room_id) VALUES 
('Poignard', 'https://static.wikia.nocookie.net/cluedo/images/8/8a/2016W2.jpg/revision/latest?cb=20200927104245', 'C''est un couteau.', 1),
('Revolver', 'https://static.wikia.nocookie.net/cluedo/images/c/cb/2016W1.jpg/revision/latest?cb=20200927104244', 'C''est un flingue.', 1),
('Chandelier', 'https://static.wikia.nocookie.net/cluedo/images/d/d9/2016W5.jpg/revision/latest?cb=20200927104246', 'C''est un chandelier.', 4),
('Corde', 'https://static.wikia.nocookie.net/cluedo/images/c/c5/2016W4.jpg/revision/latest?cb=20200927104246', 'C''est une corde.', 5), 
('Clé anglaise', 'https://static.wikia.nocookie.net/cluedo/images/7/72/2016W6.jpg/revision/latest?cb=20200927104247', 'C''est une clé anglaise.', 7),
('Tuyau de fer', 'https://static.wikia.nocookie.net/cluedo/images/1/17/2016W3.jpg/revision/latest?cb=20200927104245', 'C''est un tuyau de fer.', 9);

INSERT INTO rooms (room_name, room_image, room_description) VALUES
 ('La cuisine','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est une cuisine
 '),
 ('La salle de bal','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est une sa
 lle de bal'),
 ('La véranda','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est une véranda
 '),
 ('La salle de billard','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est un
 e salle de billard'),
 ('La bibliothèque','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est une bi
 bliothèque'),
 ('Le bureau','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est un bureau'),
 
 ('Le hall','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est un hall'),
 ('Le salon','https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est un salon'),
 ('La salle à manger', 'https://fr.shopping.rakuten.com/photo/936907516.jpg?frz-width=532&frz-fit=contain','C''est une
  salle à manger');

INSERT INTO users (user_pseudo,character_id,role_id) VALUES
 ('BetaPickle',5,2),
 ('MiloSasuke',1,2),
 ('RoxxorStone',3,2),
 ('PhantomCaptain',4,2),
 ('VirusHulk',6,2),
 ('ZeCyber',2,2),
 ('ShadowCrazy',NULL,3);

 INSERT INTO characters_rooms (character_id, room_id, arrival_hour, departure_hour) VALUES
(1, 4, '09:00:00', '09:00:00'),
(2, 9, '09:00:00', '09:22:00'),
(3, 4, '09:00:00', '09:14:00'),
(4, 5, '09:00:00', '09:13:00'),
(5, 3, '09:00:00', '09:44:00'),
(6, 6, '09:00:00', '09:05:00'),
(1, 1, '09:02:00', '10:10:00'),
(2, 1, '09:23:00', '09:52:00'),
(5, 1, '09:45:00', '10:30:00'),
(3, 5, '09:15:00', '09:50:00'),
(6, 3, '09:06:00', '09:48:00'),
(4, 9, '09:12:00', '09:42:00'),
(1, 4, '10:11:00', '11:05:00'),
(2, 7, '09:53:00', '10:31:00'),
(3, 1, '09:51:00', '11:52:00'),
(4, 1, '09:23:00', '09:52:00'),
(5, 2, '10:31:00', '11:25:00'),
(6, 5, '09:49:00', '11:03:00');