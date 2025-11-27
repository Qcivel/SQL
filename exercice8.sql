USE caisse;

-- 1) Récupérer les dates de vente pour chaque vendeur (prénom et nom)
SELECT v.prenom_vendeur, v.nom_vendeur, t.date_ticket FROM vendeur v
	INNER JOIN ticket t ON t.id_vendeur = v.id_vendeur;
    
-- 2) Récupérer les id des tickets, leur date, et le nom des articles, et leur quantité
SELECT t.id_ticket, t.date_ticket, p.nom_produit, ap.quantite_ajouter_produit FROM ticket t
	INNER JOIN ajouter_produit ap ON t.id_ticket = ap.id_ticket
	INNER JOIN produit p ON ap.id_produit = p.id_produit;
    
-- 3) Effectuer la somme de vente pour chaque article sur chaque ticket (quantité * prix article)
SELECT t.id_ticket, p.nom_produit, p.tarif_produit, (ap.quantite_ajouter_produit * p.tarif_produit) FROM ajouter_produit ap
 INNER JOIN ticket t ON t.id_ticket = ap.id_ticket
 INNER JOIN produit p ON p.id_produit = ap.id_produit;
 
 
-- 4) Récupérer les articles vendu par chaque vendeur
SELECT DISTINCT v.id_vendeur, v.prenom_vendeur, t.id_ticket, p.nom_produit, ap.quantite_ajouter_produit FROM vendeur v
	INNER JOIN ticket t ON v.id_vendeur = t.id_vendeur
    INNER JOIN ajouter_produit ap ON t.id_ticket = ap.id_ticket
    INNER JOIN produit p ON p.id_produit = ap.id_produit;
    
-- 5) Calculer le chiffre d'affaire total effectuer par chaque vendeur
SELECT v.prenom_vendeur, v.nom_vendeur, SUM(ap.quantite_ajouter_produit * p.tarif_produit) FROM vendeur v
	INNER JOIN ticket t ON v.id_vendeur = t.id_vendeur
    INNER JOIN ajouter_produit ap ON t.id_ticket = ap.id_ticket
    INNER JOIN produit p ON p.id_produit = ap.id_produit
    GROUP BY v.prenom_vendeur, v.nom_vendeur;
    
-- 6) Récupérer le vendeur qui a obtenu le meilleur chiffre d'affaire
SELECT v.prenom_vendeur, v.nom_vendeur, SUM(ap.quantite_ajouter_produit * p.tarif_produit) chiffre_affaire  FROM vendeur v
	INNER JOIN ticket t ON v.id_vendeur = t.id_vendeur
    INNER JOIN ajouter_produit ap ON t.id_ticket = ap.id_ticket
    INNER JOIN produit p ON p.id_produit = ap.id_produit
    GROUP BY v.prenom_vendeur, v.nom_vendeur
    ORDER BY chiffre_affaire DESC
    LIMIT 1;
    
-- 7) Récupérer les catégories pour lesquelles chaque vendeur a effectuer une vente
SELECT v.prenom_vendeur, v.nom_vendeur,c.nom_categorie FROM vendeur v
	INNER JOIN ticket t ON v.id_vendeur = t.id_vendeur
    INNER JOIN ajouter_produit ap ON t.id_ticket = ap.id_ticket
    INNER JOIN produit p ON p.id_produit = ap.id_produit
    INNER JOIN categorie c ON p.id_categorie = c.id_categorie
    GROUP BY v.prenom_vendeur, v.nom_vendeur,c.nom_categorie;
    
-- 8) Récupérer les catégories pour lesquelles chaque vendeur a vendu au moins 5 exemplaire d'un produit
SELECT v.prenom_vendeur, v.nom_vendeur,c.nom_categorie, ap.quantite_ajouter_produit FROM vendeur v
	INNER JOIN ticket t ON v.id_vendeur = t.id_vendeur
    INNER JOIN ajouter_produit ap ON t.id_ticket = ap.id_ticket
    INNER JOIN produit p ON p.id_produit = ap.id_produit
    INNER JOIN categorie c ON p.id_categorie = c.id_categorie
    GROUP BY v.prenom_vendeur, v.nom_vendeur,c.nom_categorie,ap.quantite_ajouter_produit
    HAVING SUM(ap.quantite_ajouter_produit) >=5 ;