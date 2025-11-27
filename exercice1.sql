-- Création de la BDD 

CREATE DATABASE IF NOT EXISTS caisse CHARSET utf8mb4;
USE caisse;

-- Création des tables

CREATE TABLE IF NOT EXISTS ticket(
id_ticket INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
date_ticket DATETIME NOT NULL,
id_vendeur INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS categorie(
id_categorie INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_categorie VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS vendeur(
id_vendeur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
prenom_vendeur VARCHAR(50) NOT NULL,
nom_vendeur VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS produit(
id_produit INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_produit VARCHAR(50) NOT NULL,
description_produit VARCHAR(255) NOT NULL,
tarif_produit DECIMAL(4,2),
id_categorie INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS ajouter_produit (
id_ajouter_produit INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
quantite_ajouter_produit INT NOT NULL,
id_ticket INT,
id_produit INT
)ENGINE=InnoDB;

ALTER TABLE produit
ADD CONSTRAINT fk_associer_categorie
FOREIGN KEY (id_categorie)
REFERENCES categorie(id_categorie)
ON DELETE CASCADE;

ALTER TABLE ticket
ADD CONSTRAINT fk_vendre_vendeur
FOREIGN KEY (id_vendeur)
REFERENCES vendeur(id_vendeur)
ON DELETE CASCADE;

ALTER TABLE ajouter_produit
ADD CONSTRAINT fk_relier_ticket
FOREIGN KEY (id_ticket)
REFERENCES ticket(id_ticket);

ALTER TABLE ajouter_produit
ADD CONSTRAINT fk_quantifier_produit
FOREIGN KEY (id_produit)
REFERENCES produit(id_produit);