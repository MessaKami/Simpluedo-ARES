# Correction par l'Équipe Crows

## Documentation 

- [X] : Règles de gestion
- [X] : Dictionnaire de données 
- [X] : MCD 
- [X] : MLD 
- [X] : MPD 
- [] : Exactitude des relations

## Création de la base de données 

- [X] : Script de création de table 
- [X] : Script de peuplement 
- [X] : Exécution sans erreur
- [X] : Gestion RBAC
- [X] : Trigger

## Requêtes et procédures stockées 

- [X] : Requêtes 
- [X] : Procédures stockés 

## Environnement sous docker 

- [X] : Mis en place et fonctionnel 

## Remarques 

- La relation entre l'entité users et roles peut être à sujet de débat
- Au niveau du MPD il est écrit que arrival_hour et departure_hour sont en Time alors que dans le dictionnaire de données ils sont en TIMESTAMPZ
- Pour l'exactitude des relations cela n'est pas validé car il est précisé que dans votre RG3 chaque joueur est soit un maitre du jeu, un observateur ou un détective donc la relation entre users et roles doit etre de 1,1 et non 0,1.
- Tout fonctionne à part le script de création de table qui ne veut pas fonctionner mais si on rentre tout à la main chaque table cela marche à la perfection mais sinon le script de peuplement marche parfaitement sans aucune erreur. Et le script des procedures-functions marche à la perfection
 
