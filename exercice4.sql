-- Création de la base de données
CREATE DATABASE IF NOT EXISTS book CHARSET utf8mb4;

USE book;

-- Création des tables

CREATE TABLE IF NOT EXISTS category(
id_category INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category_name VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS author(
id_author INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
pseudo VARCHAR(50) UNIQUE NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS book(
id_book INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title VARCHAR(50) NOT NULL,
description VARCHAR(255) NOT NULL,
publication_date DATE NOT NULL,
cover VARCHAR(255) NOT NULL,
id_author INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS commentary(
id_commentary INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
content VARCHAR(255) NOT NULL,
created_at DATETIME NOT NULL,
enabled INT NOT NULL,
id_account INT NOT NULL,
id_book INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `account`(
id_account INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
firstname  VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
password_account VARCHAR(50) NOT NULL,
created_at DATETIME NOT NULL,
status_account BOOLEAN NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS book_category(
id_book INT,
id_category INT,
PRIMARY KEY(id_book, id_category)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS book_account(
id_book INT NOT NULL,
id_account INT NOT NULL,
PRIMARY KEY(id_book, id_account)
)ENGINE=InnoDB;

-- Ajouter les contraintes de clé étrangére

ALTER TABLE commentary
ADD CONSTRAINT fk_add_book
FOREIGN KEY(id_book)
REFERENCES book(id_book)
ON DELETE CASCADE;

ALTER TABLE commentary
ADD CONSTRAINT fk_post_account
FOREIGN KEY(id_account)
REFERENCES `account`(id_account)
ON DELETE CASCADE;

ALTER TABLE book
ADD CONSTRAINT fk_write_author
FOREIGN KEY(id_author)
REFERENCES author(id_author)
ON DELETE CASCADE;

ALTER TABLE book_category
ADD CONSTRAINT fk_to_detail_book
FOREIGN KEY(id_book)
REFERENCES book(id_book);

ALTER TABLE book_category
ADD CONSTRAINT fk_detail_category
FOREIGN KEY(id_category)
REFERENCES category(id_category);

ALTER TABLE book_account
ADD CONSTRAINT fk_possess_book
FOREIGN KEY(id_book)
REFERENCES book(id_book);

ALTER TABLE book_account
ADD CONSTRAINT fk_possess_account
FOREIGN KEY(id_account)
REFERENCES `account`(id_account);

-- Ajouter un attribut dans la table account :
ALTER TABLE `account`
ADD COLUMN account_img VARCHAR(255) NOT NULL  DEFAULT 'default.png';

-- Ajouter un attribut dans la table book :
ALTER TABLE book
ADD COLUMN back_cover VARCHAR(255) NULL;

-- Ajouter un attribut dans la table commentary :
ALTER TABLE commentary
ADD COLUMN note INT NOT NULL DEFAULT 0;

-- Editer un attribut dans la table book :
ALTER TABLE book
MODIFY publication_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

/*
Exercice 1 SQL requêtes de mise à jour INSERT SQL :
 1 Créer 5 categories de book
*/

INSERT INTO category (category_name) VALUES
('Fantasy'),
('Science_fiction'),
('Policer'),
('Thriller'),
('Aventure');

-- 2 Créer 3 accounts,

INSERT INTO `account`(firstname, lastname, email, password_account, created_at, status_account, account_img) VALUES 
('Harry','Potter','harry.potter@gmail.com','934', NOW(),1, 'default.png'),
('Ron','Wisley','ron.wisley@gmail.com','0000', NOW(),1, 'default.png'),
('Hermione','Granger','hermione.grander@gmail.com','JJHFDVXVSddgjnbv', NOW(),1, 'default.png');

-- 3 Créer 5 authors

INSERT INTO author (firstname, lastname, pseudo) VALUES
('JK','rowling','JKrowling'),
('George', 'Martin', 'gmartin'),
('Agatha', 'Christie', 'achristie'),
('Victor', 'Hugo', 'vhugo'),
('Jules', 'Verne', 'jverne');

-- 3 Créer 15 books (les books sont associés à des authors),

INSERT INTO book (title, description, publication_date, cover, id_author, back_cover) VALUES
('Harry Potter 1', 'A young wizard begins his journey.', NOW(), 'hp1.jpg', 1, 'back_hp1.jpg'),
('Harry Potter 2', 'The adventure continues.', NOW(), 'hp2.jpg', 1, 'back_hp2.jpg'),
('Game of Thrones 1', 'Winter is coming.', NOW(), 'got1.jpg', 2, 'back_got1.jpg'),
('Game of Thrones 2', 'War of kings.', NOW(), 'got2.jpg', 2, 'back_got2.jpg'),
('Murder on the Orient Express', 'Detective mystery on a train.', NOW(), 'orient.jpg', 3, 'back_orient.jpg'),
('And Then There Were None', 'Ten people trapped...', NOW(), 'none.jpg', 3, 'back_none.jpg'),
('Les Misérables', 'Story of Jean Valjean.', NOW(), 'lesmis.jpg', 4, 'back_lesmis.jpg'),
('Notre-Dame de Paris', 'The hunchback legend.', NOW(), 'notredame.jpg', 4, 'back_notredame.jpg'),
('20,000 Leagues Under the Sea', 'Captain Nemo adventures.', NOW(), 'nemo.jpg', 5, 'back_nemo.jpg'),
('Around the World in 80 Days', 'Travel across the globe.', NOW(), '80days.jpg', 5, 'back_80days.jpg'),
('Journey to the Center of the Earth', 'Underground adventure.', NOW(), 'center.jpg', 5, 'back_center.jpg'),
('The Hobbit', 'Adventure of Bilbo.', NOW(), 'hobbit.jpg', 2, 'back_hobbit.jpg'),
('Fantastic Beasts', 'Wizard creatures.', NOW(), 'beasts.jpg', 1, 'back_beasts.jpg'),
('The Da Vinci Code', 'Religious thriller.', NOW(), 'davinci.jpg', 3, 'back_davinci.jpg'),
('Sherlock Holmes', 'Investigation thriller.', NOW(), 'holmes.jpg', 3, 'back_holmes.jpg');

-- 4 Associer les 15 books à des categories(existantes),
INSERT INTO book_category (id_book, id_category) VALUES
(1, 1), 
(2, 1), 
(3, 2),
(4, 2), 
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 5),
(12, 2),
(13, 1),
(14, 4),
(15, 3);

 -- 5 Associer 3 books à chaques account (book_account):
 INSERT INTO book_account (id_book, id_account) VALUES
-- Harry
(1, 1), (2, 1), (13, 1),
-- Ron
(1, 2), (2, 2), (13, 2),
-- Hermione
(15, 3), (7, 3), (5, 3);
 

 -- 6 Ajouter 2 commentaries (liés aux books) pour chaque account.

INSERT INTO commentary (content, created_at, enabled, id_account, id_book, note) VALUES
('Amazing book, I loved it!', NOW(), 1, 1, 5, 5),
('Great mystery, very captivating.', NOW(), 1, 1, 4, 4),
('Solid story, well written.', NOW(), 1, 2, 4, 4),
('Not my favorite, but good.', NOW(), 1, 2, 3, 3),
('Beautiful novel, emotional.', NOW(), 1, 3, 5, 5),
('Incredible writing!', NOW(), 1, 3, 7, 5);


-- Exercice 2 SQL requêtes de mise à jour UPDATE SQL :
-- 1 Passer le status de tous les accouts à true,
UPDATE `account` SET status_account = 1;

-- 2 Modifier le password de tous les accounts -> hash en md5,

UPDATE `account` SET password_account = md5(password_account);

-- 3 Modifier le pseudo de tous les authors -> il sera composé de la 1 lettre du firstname suivi du lastname:,ex : Victor Hugo -> vhugo,
UPDATE author
SET pseudo = CONCAT(LOWER(LEFT(firstname, 1)), LOWER(lastname));

-- 6 Modifier le lastname des authors -> passer le lastname en Majuscule.
UPDATE author
SET lastname = upper(lastname)