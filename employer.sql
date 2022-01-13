-- 1 -- Afficher la profession de l'employé 547.
	SELECT service FROM employes WHERE id_employes = '547';

-- 2 -- Afficher la date d'embauche d'Amandine.
	SELECT date_embauche FROM employes WHERE prenom = 'Amandine';

-- 3 -- Afficher le nom de famille de Guillaume
	SELECT nom FROM employes WHERE prenom = 'Guillaume';

-- 4 -- Afficher le nombre de personne ayant un n° id_employes commençant par le chiffre 5.
	SELECT COUNT(id_employes) FROM employes WHERE id_employes LIKE "5%";

-- 5 -- Afficher le nombre de commerciaux.
	SELECT COUNT(*) FROM employes WHERE service = 'commercial';

-- 6 -- Afficher le salaire moyen des informaticiens (+arrondie).
	SELECT ROUND (AVG(salaire)) FROM employes WHERE service = 'informatique';

-- 7 -- Afficher les 5 premiers employés après avoir classer leur nom de famille par ordre alphabétique.
	SELECT nom FROM employes ORDER BY nom ASC LIMIT 0,5;

-- 8 -- Afficher le coût des commerciaux sur 1 année.
	SELECT SUM(salaire*12) AS cout_commerciaux_annuel FROM employes WHERE service = 'commercial';

-- 9 -- Afficher le nombre de recrutement sur l'année 2010 (+alias).
	SELECT COUNT(date_embauche) AS nombre_recrutement_2010 FROM employes WHERE date_embauche LIKE "2010%";
ou 
	SELECT COUNT(*) FROM employes WHERE date_embauche BETWEEN "2010-01-01" AND "2010-12-31";
ou 
	SELECT COUNT(*) FROM employes WHERE date_embauche >= "2010-01-01" AND date_embauche <= "2010-12-31";

-- 10 -- Afficher le nombre de service différent
	SELECT COUNT(DISTINCT(service)) FROM employes;

-- 11 -- Afficher conjoitement le nombre d'homme et de femme dans l'entreprise
	SELECT sexe, COUNT(*) FROM employes GROUP BY sexe;

-- 12 -- Qui a été embauché en dernier
	SELECT prenom FROM employes ORDER BY date_embauche DESC LIMIT 0,1;
ou
	SELECT  date_embauche, nom, prenom FROM employes WHERE date_embauche = (SELECT MAX(date_embauche) FROM employes);

-- 13 -- Afficher le salaire moyen par service
	SELECT service, ROUND(AVG(salaire)) FROM employes GROUP BY service;

-- 14 -- Afficher le salaire moyen appliqué pour les recrutements sur la période de 2005 à 2007
	SELECT ROUND(AVG(salaire)) FROM employes WHERE date_embauche >= "2005-01-01" AND date_embauche <= "2007-12-31";

-- 15 -- Afficher tous les employes (sauf ceux du service production et secretariat)
	SELECT * FROM employes WHERE service NOT IN ("production", "secretariat");

-- 16 -- Afficher les commerciaux ayant été recrutés avant 2005 de sexe masculin et gagnant un salaire supérieur à 2500€
	SELECT prenom, nom, service, date_embauche, sexe, salaire FROM employes WHERE sexe = "m" AND salaire >= 2500 AND date_embauche < "2005-01-01";

-- 17 -- Afficher les information sur l'employé du service commercial gagnant le salaire le plus élevé
	SELECT salaire, prenom, nom, service FROM employes WHERE service = "commercial" AND salaire =(SELECT MAX(salaire) FROM employes WHERE service="commercial");

-- 18 -- Afficher le prenom du comptable le mieux payé
	SELECT prenom, salaire, service FROM employes WHERE service = "comptabilite" AND salaire =(SELECT MAX(salaire) FROM employes WHERE service="comptabilite");
ou
	SELECT prenom, nom FROM employes WHERE service ='comptabilite' ORDER BY salaire DESC LIMIT 0,1;

-- 19 -- Afficher le prenom de l'informaticien recruté en premier
	SELECT prenom, service, date_embauche FROM employes WHERE service = "informatique" AND date_embauche =(SELECT MIN(date_embauche) FROM employes WHERE service ='informatique');
ou
	SELECT prenom, nom, service, date_embauche FROM employes WHERE service ='informatique' ORDER BY date_embauche LIMIT 0,1;

-- 20 -- Augmenter chaque employé de 100€
	UPDATE employes SET salaire = (salaire + 100);

-- 21 -- Supprimer les employes du service secretariat
	DELETE FROM employes WHERE service = "secretariat";
