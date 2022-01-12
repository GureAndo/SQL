a quoi sert une base de donées ?

Elle est utile dans le cadre d'un projet informatique pour conserver des information en mememoire.

SGBD(système de gestion de base de données)
im permet d'exploiter et de faire fonctionner les base de donées(moteur)

Mcd : modèle conseptuele de donées.
BDD : Base de données
SQL: Structured Query Language
strucured > structure
Query > les requete
language > langage

une requete s'effectue en 3 etapes:
1-formulation(de ma requete)
2-Execution de ma requete
3-resultat

il y a 4 types de requete:
-affichage (select,show) requete de selection
-insertion(insert),requete d'insertion
-modification(update,replace),requete de modification
-supprimer (delete,drop,truncate), requete de supression

les type de colonnes /champs

3 grande catégorie de champs ressortent: les type numériques, les chaine de chara(txt),temporels(dates)
VARCHAR : 250 caractére
TXT : chaine de chara limités
INT : numerique
DATE : date

Connexion servur sql
mysql -u root

CrÃ©er une base de donnÃ©es?
CREATE DATABASE [nomdelabase] ;

Utiliser une base de donnÃ©es?
USE [nomdelabase] ;

Lister les base de donnÃ©es?
SHOW DATABASES;

Supprimer une base de donnÃ©es?
DROP DATABASE [nomdelabase] ;

Supprimer une table d'une base de donnÃ©es?
DROP TABLE [nomdelatable] ;

Vider le contenu d'une table d'une base de donnÃ©es?
TRUNCATE [nomdelatable] ;

Observer la structure d'une table?
DESC [nomdelatable] ;
Par exemple nous pourrions Ã©crire :?
DESC employes;
Cela nous permet de voir de quelle colonne est composÃ©e notre table.
MariaDB [entreprise]> desc employes;
+---------------+---------------+------+-----+---------+----------------+
| Field | Type | Null | Key | Default | Extra |
+---------------+---------------+------+-----+---------+----------------+
| id_employes | int(3) | NO | PRI | NULL | auto_increment |
| prenom | varchar(20) | YES | | NULL | |
| nom | varchar(20) | YES | | NULL | |
| sexe | enum('m','f') | NO | | NULL | |
| service | varchar(30) | YES | | NULL | |
| date_embauche | date | YES | | NULL | |
| salaire | float | YES | | NULL | |
+---------------+---------------+------+-----+---------+----------------+

Consulter toutes les BDD
MariaDB [(none)]> show databases;
+--------------------+
| Database |
+--------------------+
| entreprise |
| information_schema |
| mysql |
| performance_schema |
| phpmyadmin |
| test |
+--------------------+

Positionnement dans ma BDD entreprise
MariaDB [(none)]> use entreprise;
Database changed

Consulter toutes les tables
MariaDB [entreprise]> show tables;
+----------------------+
| Tables_in_entreprise |
+----------------------+
| employes |
+----------------------+
MariaDB [entreprise]> select \* from employes; // affiche moi toutes les informations de ma table employes.
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom | nom | sexe | service | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+---------------+---------+
| 350 | Jean-pierre | Laborde | m | direction | 1999-12-09 | 5000 |
| 388 | Clement | Gallet | m | commercial | 2000-01-15 | 2300 |
| 415 | Thomas | Winter | m | commercial | 2000-05-03 | 3550 |
| 417 | Chloe | Dubar | f | production | 2001-09-05 | 1900 |
| 491 | Elodie | Fellier | f | secretariat | 2002-02-22 | 1600 |
| 509 | Fabrice | Grand | m | comptabilite | 2003-02-20 | 1900 |
| 547 | Melanie | Collier | f | commercial | 2004-09-08 | 3100 |
| 592 | Laura | Blanchet | f | direction | 2005-06-09 | 4500 |
| 627 | Guillaume | Miller | m | commercial | 2006-07-02 | 1900 |
| 655 | Celine | Perrin | f | commercial | 2006-09-10 | 2700 |
| 699 | Julien | Cottet | m | secretariat | 2007-01-18 | 1390 |
| 701 | Mathieu | Vignal | m | informatique | 2008-12-03 | 2000 |
| 739 | Thierry | Desprez | m | secretariat | 2009-11-17 | 1500 |
| 780 | Amandine | Thoyer | f | communication | 2010-01-23 | 1500 |
| 802 | Damien | Durand | m | informatique | 2010-07-05 | 2250 |
| 854 | Daniel | Chevel | m | informatique | 2011-09-28 | 1700 |
| 876 | Nathalie | Martin | f | juridique | 2012-01-12 | 3200 |
| 900 | Benoit | Lagarde | m | production | 2013-01-03 | 2550 |
| 933 | Emilie | Sennard | f | commercial | 2014-09-11 | 1800 |
| 990 | Stephanie | Lafaye | f | assistant | 2015-06-02 | 1775 |
+-------------+-------------+----------+------+---------------+---------------+---------+

Affiche moi toutes les personnes qui ont un sexe fÃ©minin
MariaDB [entreprise]> select \* from employes where sexe ='f';
+-------------+-----------+----------+------+---------------+---------------+---------+
| id_employes | prenom | nom | sexe | service | date_embauche | salaire |
+-------------+-----------+----------+------+---------------+---------------+---------+
| 417 | Chloe | Dubar | f | production | 2001-09-05 | 1900 |
| 491 | Elodie | Fellier | f | secretariat | 2002-02-22 | 1600 |
| 547 | Melanie | Collier | f | commercial | 2004-09-08 | 3100 |
| 592 | Laura | Blanchet | f | direction | 2005-06-09 | 4500 |
| 655 | Celine | Perrin | f | commercial | 2006-09-10 | 2700 |
| 780 | Amandine | Thoyer | f | communication | 2010-01-23 | 1500 |
| 876 | Nathalie | Martin | f | juridique | 2012-01-12 | 3200 |
| 933 | Emilie | Sennard | f | commercial | 2014-09-11 | 1800 |
| 990 | Stephanie | Lafaye | f | assistant | 2015-06-02 | 1775 |
+-------------+-----------+----------+------+---------------+---------------+---------+

Affiche moi le nom et prenom des personnes qui ont un sexe fÃ©minin
MariaDB [entreprise]> select prenom, nom from employes where sexe ='f';
+-----------+----------+
| prenom | nom |
+-----------+----------+
| Chloe | Dubar |
| Elodie | Fellier |
| Melanie | Collier |
| Laura | Blanchet |
| Celine | Perrin |
| Amandine | Thoyer |
| Nathalie | Martin |
| Emilie | Sennard |
| Stephanie | Lafaye |
+-----------+----------+

Affiche moi les personnes travaillant au service commercial.
MariaDB [entreprise]> select nom, prenom from employes where service='commercial';
+---------+-----------+
| nom | prenom |
+---------+-----------+
| Gallet | Clement |
| Winter | Thomas |
| Collier | Melanie |
| Miller | Guillaume |
| Perrin | Celine |
| Sennard | Emilie |
+---------+-----------+

Affiche les personnes ayant un salaire supÃ©rieur Ã 2000 euros;
MariaDB [entreprise]> select prenom, nom, salaire nom from employes where salaire >= '2000';
+-------------+----------+------+
| prenom | nom | nom |
+-------------+----------+------+
| Jean-pierre | Laborde | 5000 |
| Clement | Gallet | 2300 |
| Thomas | Winter | 3550 |
| Melanie | Collier | 3100 |
| Laura | Blanchet | 4500 |
| Celine | Perrin | 2700 |
| Mathieu | Vignal | 2000 |
| Damien | Durand | 2250 |
| Nathalie | Martin | 3200 |
| Benoit | Lagarde | 2550 |
+-------------+----------+------+

Affiche les personnes ayant un salaire supÃ©rieur Ã 2000 euros et qui embauchÃ© aprÃ¨s les annÃ©es 2000
MariaDB [entreprise]> select nom, prenom from employes where salaire >"2000" AND date_embauche > "2000-01-01";
+----------+----------+
| nom | prenom |
+----------+----------+
| Gallet | Clement |
| Winter | Thomas |
| Collier | Melanie |
| Blanchet | Laura |
| Perrin | Celine |
| Durand | Damien |
| Martin | Nathalie |
| Lagarde | Benoit |
+----------+----------+

Afficher les prenoms commenÃ§ant par la lettre 's'
MariaDB [entreprise]> SELECT prenom FROM employes WHERE prenom LIKE 's%';
+-----------+
| prenom |
+-----------+
| Stephanie |
+-----------+

="est egale"

> "strictement supperieur"
> < "strictement inferieur"
> = "superieur ou egale"
> <= "inferieur ou egale"
> <> ou != "inferieur ou egale"

MariaDB [entreprise]> select prenom from employes order by prenom ASC;
+-------------+
| prenom |
+-------------+
| Amandine |
| Benoit |
| Celine |
| Chloe |
| Clement |
| Damien |
| Daniel |
| Elodie |
| Emilie |
| Fabrice |
| Guillaume |
| Jean-pierre |
| Julien |
| Laura |
| Mathieu |
| Melanie |
| Nathalie |
| Stephanie |
| Thierry |
| Thomas |
+-------------+
20 rows in set (0.000 sec)
