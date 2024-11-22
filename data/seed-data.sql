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
(1, 4, '08:00:00', '08:00:00'),
(2, 9, '08:00:00', '08:22:00'),
(3, 4, '08:00:00', '08:14:00'),
(4, 5, '08:00:00', '08:13:00'),
(5, 3, '08:00:00', '08:44:00'),
(6, 6, '08:00:00', '08:05:00'),
(1, 1, '08:02:00', '09:09:00'),
(2, 1, '08:23:00', '08:52:00'),
(5, 1, '08:45:00', '09:30:00'),
(3, 5, '08:15:00', '08:50:00'),
(6, 3, '08:06:00', '08:48:00'),
(4, 9, '08:12:00', '08:42:00'),
(1, 4, '09:11:00', '10:05:00'),
(2, 7, '08:53:00', '09:31:00'),
(3, 1, '08:51:00', '10:52:00'),
(4, 1, '08:23:00', '08:52:00'),
(5, 2, '09:31:00', '10:25:00'),
(6, 5, '08:49:00', '10:03:00');