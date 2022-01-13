		Requêtes de selection:


--affiche moi l'id_employes, le prenom, le nom, le sexe, le service, la date_embauche et le salaire de tous les employes depuis la table employes.
SELECT id_employes, prenom, nom, sexe, service, date_embauche, salaire FROM employes;

-- affiche moi toutes les infos des employes de l'entreprise, * > ALL.
SELECT * FROM employes;

-- Quels sont les prénoms et les noms des personnes travaillant dans l'entreprise?
SELECT prenom, nom FROM employes;


---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------DISTINCT : permet d'éliminer les doublons----------------
-- Quels sont les différents services occupés par les employés de mon entreprise?
SELECT DISTINCT service FROM employes;


---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
----------WHERE -----------------
--Quels sont les employés du services informatique?
SELECT prenom, nom FROM employes WHERE service = "informatique";
-- =
--SELECT > type de champs 
--FROM > d'où
--WHERE > a condition que

--S'il sagit d'un chiffre je ne suis pas obligé de mettre "" / '' autour de la valeur.


---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
--------BETWEEN --------------------------
--Quels sont les employés recrutés entre 2010 et aujourd'hui?
SELECT prenom, nom, date_embauche FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND "2016-09-28";

SELECT CURDATE();-- curdate > date d'aujourd'hui.
SELECT prenom, nom, date_embauche FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND CURDATE();


---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
---------LIKE--------------------
--Quels sont les employés dont le prénom commence par un s?
SELECT prenom, nom FROM employes WHERE prenom LIKE "s%";
-- "s%" -> S et peu importe ce qui suit.

--Quels sont les employés dont le prénom est composé?
SELECT prenom, nom FROM employes WHERE prenom LIKE "%-%";

--Affiche tous les employés de mon entreprise sauf ceux qui travaillent au service informatique?
SELECT prenom, nom FROM employes WHERE service != "informatique";
--  !=  -> différent de..

--Afficher les employés dont le salaire est supérieur à 3000€?
SELECT prenom, nom, salaire FROM employes WHERE salaire > 3000;

--Classer les employés par ordre alphabétique des prénoms :
-----------ORDER BY = permet d'effectuer un classement-----------
SELECT prenom FROM employes ORDER BY prenom ASC; --ASC: ascendant, croissant (par défaut).
SELECT prenom FROM employes ORDER BY prenom DESC; --DESC : descendant, décroissant.

SELECT prenom, salaire FROM employes ORDER BY salaire DESC, prenom ASC;

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
----------LIMIT---------------------
--Afficher les employés 3 par 3 :
SELECT prenom FROM employes ORDER BY prenom ASC LIMIT 0, 3;
--(1er chiffre indique a partir d'ou commencer et le 2ème chiffre indique combien on en selectionne).


--Affichage des employés avec leur salaire annuel :
SELECT prenom, salaire*12 FROM employes;
SELECT prenom, salaire*12 As salaire_annuel FROM employes;
-- As > alias salaire*12 deviens salaire_annuel (éphémère).


--Affiche la masse salariale de mon entreprise :
SELECT SUM(salaire*12) AS masse_salariale FROM employes;

--Affiche la masse salariale du service informatique :
SELECT SUM(salaire*12) AS masse_salariale FROM employes WHERE service ="informatique";

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
------------AVG (average -> moyenne)----------
--Affiche le salaire moyen :
SELECT AVG(salaire) FROM employes;

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
----------ROUND (arrondi) -------------
--Affichage du salaire moyen arrondi :
SELECT ROUND (AVG(salaire)) FROM employes;

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------COUNT------------
-- affiche le nombre de femmes dans l'entreprise :
SELECT COUNT(*) FROM employes WHERE sexe = "f";
--count(employes)/ count(salaire)/ count(prenom) >=> count(*).

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------MIN/MAX ----------------
-- Afficher le salaire minimum/maximum de mon entreprise :
SELECT salaire FROM employes ORDER BY salaire ASC LIMIT 0,1;
SELECT MIN(salaire) FROM employes;
SELECT MAX(salaire) FROM employes;

--Je souhaite savoir quel est le prenom et le salaire de la personne qui gagne le plus d'argent :
SELECT prenom, MAX(salaire) FROM employes;
--Je souhaite savoir quel est le prenom et le salaire de la personne qui gagne le moins d'argent :
SELECT prenom(MIN(salaire)) FROM employes;

		----------------------
		-------ERREUR---------
		----------------------

--ceci ne fonctionne pas. Pas d'erreur de SYNTAX, simplement une erreur dans le fonctionnement des requêtes SQL.
-- la bonne reponse : REQUÊTE IMBRIQUEE
>>>  SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
---------IN & NOT IN-----------------

--Je souhaite connaitre le prénom des employés travaillant dans le service comptabilité et le service informatique
SELECT prenom FROM employes WHERE service IN("informatique", "comptabilite");
	-- IN > permet d'inclure plusieurs valeurs
	-- = > permet d'inclure une seule valeur

--Je souhaite connaitre le prenom de tous les salaries sauf ceux travaillant pour le sevice comptabilité ou informatique
SELECT prenom FROM employes WHERE service NOT IN ("informatique", "comptabilite");
	-- NOT IN > permet d'exclure plusieurs valeurs
	-- != > permet d'exclure une seule valeur

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
------------AND & OR----------

-- je souhaite afficher les commerçants gagnant moins de 2000€
SELECT prenom, nom, salaire, service FROM employes WHERE service = "commercial" AND salaire < 2000;
	-- AND > et... (nouvelle condition supplémentaire)

--- je souhaite connaitre le nom et le prenom des employes du service commercial travaillant pour un salaire de 1800€ ou de 1500€
SELECT prenom, nom, salaire, service FROM employes WHERE service = "commercial" AND (salaire = 1800 OR salaire = 1500);


---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
--------GROUP BY : permet d'effectuer des regroupements-----------

--affichage du nombre d'employes par service
SELECT service, COUNT(*) FROM employes GROUP BY service;

--affichage du nombre d'employes par service ayant plus de deux salaries
SELECT service, COUNT(*) FROM employes GROUP BY service HAVING COUNT(*) > 2;
	--cas particulier : on utilise HAVING au lieu de WHERE dans le cas de l'utilisation de GROUP BY

