		REQUETES DINSERTION :

	SELECT * FROM employes;

INSERT INTO employes (id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (NULL, 'Lauréline', 'Drieu', 'f', 'informatique', CURDATE(), 5001);
	-- ajout de (l'id_employes + NULL) pas obligatoire car auto-incrémenter

INSERT INTO employes VALUES ('','Lauréline', 'Drieu', 'f', 'informatique', CURDATE(), 5001); 
--/!\ Problème avec la dernière version de SQL car on ne peut plus mettre NULL ou vide dans la valeur de l'ID. /!\


-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------

		REQUETES DE MODIFICATION :

-- je souhaite modifier le salaire de l'employe Jean-Pierre :
UPDATE employes SET salaire = 4500 WHERE prenom = 'Jean-Pierre';

UPDATE employes SET salaire = 4500 WHERE id_employes = 350;
	--il est préférable de faire une modification (ou suppression) via l'ID >> car il peut y avoir plusieur Jean-Pierre

-- je souhaite modifier le salaire et le service de Julien Cottet (699)
UPDATE employes SET salaire = 1500, service = 'marketing' WHERE id_employes = 699;


REPLACE INTO employes (id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (991, 'Lauréline', 'Drieu', 'f', 'informatique', CURDATE(), 5001);
-- REPLACE fonctionne comme l'INSERT: 
-- Si l'enregistrement existe deja > il le modifie
-- Sinon > il insert un nouvel enregistrement


-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------

		REQUETES DE SUPPRESSION:

-- je souhaite supprimer l'employes id 876
DELETE FROM employes WHERE id_employes = 876;
	--il est préférable de supprimer un enregistrement en utilisant l'ID et non le prenom par exemple.

-- je souhaite supprimer les employes 990 et 739
DELETE FROM employes WHERE id_employes = 990 OR id_employes = 739; 
--~~~~ici si on met AND au lieu de OR, alors ça sera l'employe avec (l'id 990 + l'id 739) qui sera supprimer,
DELETE FROM employes WHERE id_employes IN (990,739);