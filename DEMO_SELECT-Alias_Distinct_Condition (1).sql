/*
SELECT : requête de consultation
*/
SELECT title, `description` FROM book;

-- Convention : préfixer le nom d'un champ par le nom de sa table
SELECT book.title, book.`description` FROM book;

-- * : signifie TOUS LES CHAMPS
-- IMPORTANT : C'est sous-optimal, sous-performant
-- -> INTERDICTION DE L'UTILISER DANS DES PROJETS (même le projet fil rouge)
SELECT * FROM book;

SELECT book.id_book, book.title, book.`description`, book.publication_date, book.cover, book.id_author, book.back_cover FROM book;

-- AS : donne un alias à un champ ou une table
SELECT b.title, b.`description` FROM book AS b;
SELECT b.id_book, b.title, b.`description`, b.publication_date, b.cover, b.id_author, b.back_cover FROM book AS b;
SELECT b.id_book, b.title, b.`description`, b.publication_date, b.cover, b.id_author, b.back_cover FROM book b;

SELECT CONCAT(LEFT(a.firstname,1), a.lastname) FROM `account` a;
SELECT CONCAT(LEFT(a.firstname,1), a.lastname) diminutif FROM `account` a;


/*
DISCTINCT : élimine les sorties de données qui sont en double
*/
INSERT INTO `account` (firstname, lastname, email, `password`, created_at, `status`)
	VALUES ("Mathieu", "Pech", "mapech@gmail.com", MD5(12345), NOW(), 1),
		("Mathieu", "PARIS", "m.paris@gmail.com", MD5(12345), NOW(), 1);
    
SELECT a.firstname FROM `account` a;

SELECT DISTINCT a.firstname FROM `account`a; 
SELECT DISTINCT a.firstname, a.lastname FROM `account`a; 

/*
IN : condition pour qu'un champ corresponde à au moins une valeur parmi une liste
*/
SELECT b.title FROM book b
	WHERE b.publication_date IN ("1983-01-01","1959-01-01","2001-01-01","2025-01-01","1985-01-01");

-- -> équivalent à cet enchaînement de OR    
SELECT b.title FROM book b
	WHERE b.publication_date = "1983-01-01"
		OR b.publication_date = "1959-01-01"
        OR b.publication_date = "2001-01-01"
        OR b.publication_date = "1925-01-01"
        OR b.publication_date = "1985-01-01";
	
/*
BETWEEN... AND : définit des bornes qui doivent contenir la valeur d'un champ
*/
SELECT b.title FROM book b
	WHERE b.publication_date BETWEEN "1901-01-01" AND "1959-01-01";

-- -> Equivalent à
SELECT b.title FROM book b
	WHERE b.publication_date >= "1901-01-01" AND b.publication_date <= "1959-01-01";

/*
LIKE : vérifie si une combinaison de caractère apparaît au sein du champ voulu
% = n'importe quelle combinaison de caractère
*/
SELECT b.title FROM book b
	WHERE b.title LIKE "%a%";
    
SELECT b.title FROM book b
	WHERE b.title LIKE "a%";
    
SELECT b.title FROM book b
	WHERE b.title LIKE "%a";
    
SELECT b.title FROM book b
	WHERE b.title LIKE "%e%a%";

-- -> fonctionne aussi pour les chiffres
SELECT b.id_book, b.title FROM book b
	WHERE b.id_book LIKE "%2%";
    
    
/*
ORDER BY
*/
SELECT b.id_book, b.title FROM book b;

SELECT b.id_book, b.title FROM book b
	ORDER BY b.title;

SELECT b.id_book, b.title FROM book b
	ORDER BY b.title DESC;
    
SELECT a.id_account, a.firstname, a.lastname FROM `account`a
	ORDER BY a.firstname, a.lastname DESC;