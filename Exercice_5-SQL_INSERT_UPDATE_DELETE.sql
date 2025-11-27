ALTER TABLE `account` ADD COLUMN account_img VARCHAR(255) NOT NULL DEFAULT "default.png";

ALTER TABLE book ADD COLUMN back_cover VARCHAR(255) NULL;

ALTER TABLE commentary ADD COLUMN note INT NOT NULL DEFAULT 0;

ALTER TABLE book MODIFY publication_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

/*
EXERCICE 01 - INSERT
*/

INSERT INTO category(category_name) 
	VALUES ("Fantasy"), ("Science-fiction"), ("Horreur"), ("Thriller"), ("Romance");
    
INSERT INTO `account`(firstname, lastname, email, `password`, created_at, `status`, account_img)
	VALUES ("Yoann","Depriester","yoyo@gmail.com","12345","2025-11-7 11:05:15",1,'avatar.jpg'),
		("Mathieu","Mithridate","matmit@gmail.com","12345","2025-11-8 16:32:42",1,'backking.jpg'),
        ("Jeff","Pech","jefferson@gmail.com","12345",NOW(),1,'jeffrey.jpg');
        
INSERT INTO author (firstname, lastname, pseudo)
	VALUES ("J.R.R","Tolkien","JJ"),
		("Georges","Martin","Georgy"),
        ("Isaac","Asimov","MisterMov"),
        ("Terry","Pratchet","Rincevent"),
        ("Louis Ferdinand","Céline","Bardamu");

INSERT INTO book (title, `description`, publication_date, cover, back_cover, id_author)
	VALUES("Le Hobbit","Quand on a besoin d'un plus petit que soi face à un dragon", "1947-01-01 00:00:00", "hobbit.png", "thorin.png", 1),
		("Le Seigneur des Anneaux","Mort à Sauron", "1959-01-01 00:00:00", "frodon.png", "sam.png", 1),
        ("Le Silmarillon","Plein d'histoire de la Terre du Milieu", "1965-01-01 00:00:00", "Luthien.png", "Beren.png", 1),
        ("A song of Ice and Fire","Les guguere du Throne", "1993-01-01 00:00:00", "stark.png", "baratheon.png", 2),
        ("Le Trône de Fer","Les gueguere chapitre 2", "1995-01-01 00:00:00", "martel.png", "grejoy.png", 2),
        ("Fondation","Les Lois de la Robotiques", "1951-01-01 00:00:00", "robot.png", "tobor.png", 3),
        ("Les Robots","Pleins de Robot", "1967-01-01 00:00:00", "cover.png", "back.png", 3),
        ("Les Cavernes d'Acier","Descente dans des trous", "1956-01-01 00:00:00", "cover.png", "back.png", 3),
        ("La Huitième Couleur","A propos de la couleur qui n'existe pas", "1985-01-01 00:00:00", "couleur01.png", "couleur02.png", 4),
        ("Timbré","Des fous", "1986-01-01 00:00:00", "mad.png", "dog.png", 4),
        ("Morteimer","L'histoire d'un stagiaire chez la MORT", "1991-01-01 00:00:00", "morteimer.png", "mort.png", 4),
        ("Sourcellerie","Des cherceurs de Sources", "1993-01-01 00:00:00", "source.png", "notwitcher.png", 4),
        ("Voyage au bout de la nuit","Voyage Voyage", "1932-01-01 00:00:00", "voyage.png", "nocturne.png", 5),
        ("Mort à crédit","Avez vous assez sur votre compte ?", "1936-01-01 00:00:00", "morte.png", "credit.png", 5),
        ("Guignol's Band","Une histoire granguignolesque", "1944-01-01 00:00:00", "guignol.png", "band.png", 5);

INSERT INTO book_category (id_book, id_category)
	VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,2),(7,2),(8,2),(9,1),(10,1),(11,1),(12,1),(13,3),(14,3),(15,3);
    
INSERT INTO commentary (content, created_at, enabled, note, id_account, id_book)
	VALUES ("Un grand classique", NOW(), 1, 9, 1, 1),
		("La Fondation de notre Fantasy moderne", NOW(), 1, 10, 1, 2),
        ("Des Fondations Solides", NOW(), 1, 10, 2, 6),
        ("J'adore le personnage de le Mort", NOW(), 1, 8, 2, 11),
        ("Je me suis bien marré tellement c'est vrai !", NOW(), 1, 7, 3, 15),
        ("Et à la fin, ils meurrent tous !", NOW(), 1, 8, 3, 14);


/*
EXERCICE 02 - UPDATE
*/
UPDATE `account`SET `status` = 1;

UPDATE `account`SET `password`= MD5(`password`);

-- CONCAT() : permet de coller des chaînes de caractère ensemble
SELECT CONCAT('yoann','depriester');

-- LEFT(string, number) : conserve 'number' lettre à partir de la gauche de ma 'string'
SELECT LEFT('yoann',1);

-- Assemblage des 2 fonctions pour coller y à depriester
SELECT CONCAT(LEFT('yoann',1),'depriester');

-- Utilisation dans mon UPDATE
UPDATE author SET pseudo = CONCAT(LEFT(firstname,1),lastname);

-- ADDDATE(date_origin, nbr_jour) : ajoute un nombre de jour à une date
SELECT ADDDATE("2019-01-01", 365);

UPDATE `account`SET created_at = ADDDATE(created_at, 365);


UPDATE book SET cover = 'update_cover' WHERE title BETWEEN 'a' AND 'n';

-- UPPER() : transforme toutes les minuscule en majuscule
SELECT UPPER('minuscule');

UPDATE `account`SET lastname = UPPER(lastname);

/*
EXERCICE 3 - DELETE
*/
DELETE FROM commentary WHERE id_account BETWEEN 1 AND 2;

DELETE FROM category WHERE category_name BETWEEN 'a' AND 'p';
-- Si je n'avais pas mis en place la suppression en Cascade sur les clés étrangères
-- dans book_category, j'aurai dû faire cette requête avant la précédente :
-- DELETE FROM book_category WHERE id_category IN (SELECT id_category FROM category WHERE category_name BETWEEN 'a' AND 'p');

DELETE FROM book WHERE publication_date < "1900-01-01 00:00:00";

DELETE FROM `account` WHERE id_account = 1;