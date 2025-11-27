USE books;

/*JOINTURE : INNER JOIN*/

-- Récupérer les auteurs des livres
-- 1) Identifier les données et les tables où elles se trouvent
-- 2) Identifier la clé étrangère qui relie mes tables
-- 3) Mettre la clé étrangère à EGALITE avec sa clé primaire de référence
SELECT a.firstname, a.lastname, a.pseudo, b.title FROM author a
	INNER JOIN book b ON a.id_author = b.id_author;


-- Récupérer les catégories dans lesquelles les auteurs ont écrit
SELECT a.firstname, a.lastname, a.pseudo, c.category_name FROM book b
	INNER JOIN author a ON a.id_author = b.id_author
    INNER JOIN book_category bc ON  b.id_book = bc.id_book
    INNER JOIN category c ON bc.id_category = c.id_category;

