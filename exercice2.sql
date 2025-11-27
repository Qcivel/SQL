-- Création de la BDD 

CREATE DATABASE IF NOT EXISTS entreprise CHARSET utf8mb4;
USE entreprise;

-- Création des tables

CREATE TABLE IF NOT EXISTS poste(
id_poste INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_poste VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS type_absence(
id_type_absence INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_type_absence VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS type_utilisateur(
id_type_utilisateur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_type_utilisateur VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS employe(
id_employe INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_employe VARCHAR(50) NOT NULL,
prenom_employe VARCHAR(50) NOT NULL,
age_employe INT NOT NULL,
tel_employe INT NOT NULL,
nom_rue_employe VARCHAR(50) NOT NULL,
num_rue_employe INT NOT NULL,
code_postal_employe INT NOT NULL,
ville_employe VARCHAR(50),
id_poste INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS utilisateur(
id_utilisateur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_utilisateur VARCHAR(50) NOT NULL,
login_utilisateur VARCHAR(50) UNIQUE NOT NULL,
mot_passe_utilisateur VARCHAR(100) NOT NULL,
id_type_utilisateur INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS absence(
id_absence INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
date_debut_absence DATE NOT NULL,
date_reprise_absence DATE NOT NULL,
id_type_absence INT NOT NULL,
id_employe INT NOT NULL
)ENGINE=InnoDB;

ALTER TABLE employe 
ADD CONSTRAINT fk_occuper_poste
FOREIGN KEY (id_poste)
REFERENCES poste(id_poste)
ON DELETE CASCADE;

ALTER TABLE utilisateur
ADD CONSTRAINT fk_attribuer_type_utilisateur
FOREIGN KEY (id_type_utilisateur)
REFERENCES type_utilisateur(id_type_utilisateur)
ON DELETE CASCADE;

ALTER TABLE absence
ADD CONSTRAINT fk_rattacher_employe
FOREIGN KEY (id_employe)
REFERENCES employe(id_employe)
ON DELETE CASCADE;

ALTER TABLE absence
ADD CONSTRAINT fk_detailler_type_absence
FOREIGN KEY (id_type_absence)
REFERENCES type_absence(id_type_absence)
ON DELETE CASCADE;

-- Ajouter une colonne dans la table Absence : motif varchar(100) not null,
ALTER TABLE absence
ADD motif VARCHAR(100) NOT NULL;

-- Renommer dans la table poste la colonne nom_poste en métier
ALTER TABLE poste
CHANGE nom_poste metier VARCHAR(50);

-- Remplacer dans la table absence le format de date_debut_absence en DATETIME,
ALTER TABLE absence
MODIFY COLUMN date_debut_absence DATETIME;

-- Remplacer dans la table absence le format de date_reprise_absence en DATETIME,
ALTER TABLE absence
MODIFY COLUMN date_reprise_absence DATETIME;
