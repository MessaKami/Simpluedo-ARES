-- Création du futur propriétaire de la base de données après s'être connecté en tant que postgres
CREATE ROLE colonel_moutarde WITH CREATEDB CREATEROLE LOGIN PASSWORD 'danslacuisineaveclechandelier';

-- Création de la base de données, toujours connecté en tant que postgres et attribution
CREATE DATABASE simpluedo OWNER colonel_moutarde;

-- ensuite se déconnecter de psql et du super admin pour se connecter à pgcli
pgcli -h localhost -U colonel_moutarde -d simpluedo

-- entrer le mot de passe de colonel_moutarde
