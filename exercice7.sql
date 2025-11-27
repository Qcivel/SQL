USE caisse;


-- 1) Calculer le nombre de vendeur
SELECT COUNT(v.id_vendeur) FROM vendeur v;

-- 2) Calculer le nombre de ticket
SELECT COUNT(t.id_ticket) FROM ticket t;

-- 3) Calculer le nombre de ticket qu'a vendu chaque vendeur
SELECT t.id_vendeur, COUNT(t.id_ticket) FROM ticket t 
	GROUP BY t.id_vendeur;
    
-- 4) Calculer la quantité moyenne de produit vendu (au total)
SELECT AVG(ap.quantite_ajouter_produit) FROM ajouter_produit ap;

-- 5) Calculer la quantité moyenne de produit vendu sur chaque ticket
SELECT id_ticket, AVG(ap.quantite_ajouter_produit) FROM ajouter_produit ap
	GROUP BY ap.id_ticket;
    
-- 6) Compter le nombre de fois qu'un article a été vendu (on ne s'intéresse pas à la quantité, juste le nombre fois qu'il apparait sur les ticket)
SELECT id_produit, COUNT(ap.quantite_ajouter_produit) FROM ajouter_produit ap
	GROUP BY ap.id_produit;
    
-- 7) Trouver la date de vente la plus ancienne
SELECT MIN(t.date_ticket) FROM ticket t;

-- 8) Calculer le prix moyen des produits par catégorie
SELECT p.id_categorie, AVG(p.tarif_produit) FROM produit p
	GROUP BY p.id_categorie;
    
-- 9) Calculer le prix total des produit par catégorie
SELECT p.id_categorie, SUM(p.tarif_produit) FROM produit p
	GROUP BY p.id_categorie;
    
-- 10) Calculer le prix moyen des produits en ne tenant pas compte des produits coûtant plus de 50 euros
SELECT AVG(p.tarif_produit) FROM produit p
	WHERE p.tarif_produit <=50;
    
-- 11) Obtenir les tickets dont la quantité Moyenne de produit vendu est supérieur à 2
SELECT ap.id_ticket, AVG(ap.quantite_ajouter_produit) FROM ajouter_produit ap
	GROUP BY ap.id_ticket
    HAVING AVG(ap.quantite_ajouter_produit) > 2;
    
-- 12) Obtenir les produits dont la quantité maximum apparaissant sur les tickets est de 1
SELECT ap.id_ticket, ap.id_produit, MAX(ap.quantite_ajouter_produit) FROM ajouter_produit ap
	GROUP BY ap.id_ticket, ap.id_produit
	HAVING MAX(ap.quantite_ajouter_produit) =1;
