USE books;

-- 1) Sélectionner le nom des author
SELECT a.lastname, a.firstname FROM author a;

-- 2) Sélectionner les id, le content et la date des commentaries
SELECT c.id_commentary, c.content, c.created_at FROM commentary c;

-- 3) Sélectionner les commentaries (content, note, created_at) posté après le 01 Novembre 2025
SELECT c.content, c.note, c.created_at FROM commentary c
	WHERE c.created_at > "2025-11-01";
    
-- 4) Sélectionner les livres (title, description, publication_date) posté avant le 13 Avril 1995
SELECT b.title, b.description, b.publication_date FROM book b
	WHERE b.publication_date < "1995-04-13";
    
-- 5) Sélectionner les account dont la date de création est strictement supérieur au 01 Janvier 2025 ET dont le nom de famille contient la lettre 'a'
    SELECT 	a.id_account, a.firstname, a.lastname, a.email FROM `account` a
		WHERE a.created_at > "2025-01-01" AND a.lastname LIKE "%a%";
        
-- 6) Sélectionner les author dont le prénom se termine par la lette 'e'
SELECT a.firstname, a.lastname, a.pseudo FROM author a
	WHERE a.firstname LIKE "%e";
    
-- 7) Sélectionner les livre dont le title commence par 'ba' OU qui contienne un apostrophe OU dont la cover correspond à l'une des valeurs suivante : update_cover, mort.png, yearOne.jpg, default_cover
    SELECT b.title, b.cover FROM book b 
    WHERE b.title LIKE "ba%" OR b.title LIKE "%'%" OR b.cover IN ("update_cover, mort.png, yearOne.jpg, default_cover");
    
-- 8) Sélectionner les livres dont l'id contient le nombre 1 OU dont la description est supérieur ou égal à Maurice 
SELECT b.id_book, b.title, b.`description` FROM book b 
WHERE id_book LIKE "%1%" 
	OR b.`description` >= "Maurice"; 
    