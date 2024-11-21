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
