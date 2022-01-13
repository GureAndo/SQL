-- SQL n'est pas sensible à la casse mais par convention, on met tous les mots clés en MAJUSCULE.

SHOW DATABASES; 
-- permet de voir toutes les BDD sur notre serveur de BDD.

CREATE DATABASE entreprise;
-- créer une nouvelle base de données.

USE entreprise;
-- permet d'utiliser une BDD.

DROP DATABASE entreprise;
-- /!!\ supprimer complètement une BDD. /!!\

CREATE TABLE employes;
-- permet de créer une nouvelle table dans notre BDD.

DROP TABLE nom_de_la_table;
-- permet de supprimer complètement une table.

TRUNCATE nom_de_la_table;
-- permet de vider une table.

DESC employes;
-- permet de voir la structure de ma table.

SHOW TABLES;
-- permet de voir la liste des tables qu'il y a dans cette BDD.
