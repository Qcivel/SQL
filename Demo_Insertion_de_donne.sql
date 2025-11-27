INSERT INTO categorie (nom_categorie) VALUES ('fruit'),('jouet'),('musique');

INSERT INTO vendeur (nom_vendeur, prenom_vendeur) VALUES ("Depriester","Yoann"),("Mithridate","Mathieu"),("Pech","Jeff");

INSERT INTO ticket (date_ticket, id_vendeur)
	VALUES ("2025-10-01 15:31:25",1),
		("2025-10-01 17:13:12",2),
        ("2025-10-02 10:03:42",3),
        ("2025-10-05 11:12:25",1),
        ("2025-10-12 09:31:17",3),
        ("2025-10-31 12:12:12",1);

INSERT INTO produit (nom_produit, description_produit, tarif_produit, id_categorie)
	VALUES("Pomme","bha... des pommes...",4.35,1),
		("Banane","BANANA !!!",2.90,1),
        ("figurine de Space Marines","Warhammer 40K",50.90,2),
        ("Guitare Electrique","Pour un boeuf d'ENFER",99,3),
        ("Poster d'Iron Maiden","FEAR OF THE DARK",35,3),
        ("Triptyque de Donjons et Dragons","Le papa du Jeu de Rôle",90.90,2);
        
INSERT INTO ajouter_produit (id_ticket, id_produit, quantite_ajouter_produit)
	VALUES (1, 1, 5),
		(1, 3, 1),
        (2, 2, 3),
        (2, 6, 1),
        (3, 4, 1),
        (3, 5, 1),
        (3, 1, 1),
        (4, 6, 1),
        (4, 3, 3),
        (5, 1, 5),
        (5, 2, 5),
        (5, 4, 1),
        (6, 1, 3),
        (6, 2, 2),
        (6, 3, 10);