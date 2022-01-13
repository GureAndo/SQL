-- 1 -- Afficher l'ID des livres qui sont dans la nature;
	SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;
	-- Pour NULL on utilise pas '=' mais 'IS' ;

-- 2 -- Titres des livres dans la nature
	SELECT titre FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);

-- 3-- je souhaite connaitre les id des livre que chloe a emprunter
	SELECT id_livre FROM emprunt WHERE id_abonne IN (SELECT id_abonne FROM abonne WHERE prenom = 'Chloe');

-- 4 -- afficher les prenoms des abonnes ayant amprunté un livre le 19/12/2014
	SELECT prenom FROM abonne WHERE id_abonne IN (SELECT id_abonne FROM emprunt WHERE date_sortie = "2014-12-19");
	
-- 5 -- afficher la liste des abonnes ayant deja emprunter un livre d'alphonse Daudet
	SELECT prenom FROM abonne WHERE id_abonne IN(SELECT id_abonne FROM emprunt WHERE id_livre In(SELECT id_livre FROM livre WHERE auteur = "ALPHONSE DAUDET"));

-- 6 -- afficher le titre des livre que Chloe a emprunté	
	SELECT titre FROM livre WHERE id_livre IN(SELECT id_livre FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom = "Chloe"));

-- 7 -- afficher le titre des livre que Chloe n'a pas encore emprunté
	SELECT titre FROM livre WHERE id_livre NOT IN(SELECT id_livre FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom = "Chloe"));
/*POUR METTRE EN NEGATION >> NOT*/

-- 8 -- afficher le titre des livre que Chloe n'a pas encore rendu
	SELECT titre FROM livre WHERE id_livre IN(SELECT id_livre FROM emprunt WHERE date_rendu = NULL AND id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom = "Chloe"));
/* QUAND la valeur est NULL >> pas de = mais IS */
	SELECT titre FROM livre WHERE id_livre IN(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL AND id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom = "Chloe"));

-- 9 -- afficher le prenom de l'abonne qui a emprunter le + de livre	
	SELECT prenom FROM abonne WHERE id_abonne =(SELECT id_abonne FROM emprunt GROUP BY id_abonne ORDER BY COUNT(id_abonne) DESC LIMIT 0,1);
-- pour récupérer l'id_abonne de la personne ayant emprunter le plus de livre il faut compter le nombre d'enregistrement la concrnant dans la table emprunt.
--On utilise alors GROOUP BY pour regrouper tous les enregistrement par id_abonne puis ORDER BY sur COUNT(id_abonne) pour trier dans l'order
--de nombre d'enregistrement. Enfin LIMIT nous permet d'afficher seulement 1 resultat.

-- 10 -- Combien de livres GUILLAUME a-t-il emprunter?
SELECT COUNT(*) FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');

