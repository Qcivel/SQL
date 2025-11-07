-- Création de la base de données
CREATE DATABASE IF NOT EXISTS quizz CHARSET utf8mb4;

USE quizz;

-- Création des tables

CREATE TABLE IF NOT EXISTS category(
category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS played(
played_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
sucessfull BOOLEAN NOT NULL,
create_at DATETIME NOT NULL,
users_id INT,
quizz_id INT,
question_id INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users(
users_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
password_users VARCHAR(100) NOT NULL,
roles VARCHAR(255) NOT NULL,
avatar VARCHAR(255) UNIQUE 
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS quizz(
quizz_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
img VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS answer(
answer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
text_answer VARCHAR(100) NOT NULL,
valid BOOLEAN NOT NULL,
answer_point INT NOT NULL,
question_id INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS question(
question_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title VARCHAR(100) NOT NULL,
description VARCHAR(255) NOT NULL,
img VARCHAR(255) NOT NULL,
multiple INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS played_answer(
answer_id INT,
played_id INT,
PRIMARY KEY(answer_id, played_id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS quizz_question(
question_id INT,
quizz_id INT,
PRIMARY KEY(question_id, quizz_id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS quizz_category(
category_id INT,
quizz_id INT,
PRIMARY KEY(category_id , quizz_id)
)ENGINE=InnoDB;


-- Ajouter les contraintes de clé étrangére

ALTER TABLE played
ADD CONSTRAINT fk_to_attached_users
FOREIGN KEY(users_id)
REFERENCES users(users_id)
ON DELETE CASCADE;

ALTER TABLE played
ADD CONSTRAINT fk_to_played_quetion
FOREIGN KEY(question_id)
REFERENCES question(question_id)
ON DELETE CASCADE;

ALTER TABLE played
ADD CONSTRAINT fk_to_assigned_quizz
FOREIGN KEY(quizz_id)
REFERENCES quizz(quizz_id)
ON DELETE CASCADE;

ALTER TABLE answer
ADD CONSTRAINT fk_to_add_question
FOREIGN KEY(question_id)
REFERENCES question(question_id)
ON DELETE CASCADE;

ALTER TABLE played_answer
ADD CONSTRAINT fk_to_answer_played
FOREIGN KEY(played_id)
REFERENCES played(played_id);

ALTER TABLE played_answer
ADD CONSTRAINT fk_to_answer_answer
FOREIGN KEY(answer_id)
REFERENCES answer(answer_id);

ALTER TABLE quizz_category
ADD CONSTRAINT fk_to_qualify_quizz
FOREIGN KEY(quizz_id)
REFERENCES quizz(quizz_id);

ALTER TABLE quizz_category
ADD CONSTRAINT fk_to_qualify_category
FOREIGN KEY(category_id)
REFERENCES category(category_id);

ALTER TABLE quizz_question
ADD CONSTRAINT fk_to_contain_quizz
FOREIGN KEY(quizz_id)
REFERENCES quizz(quizz_id);

ALTER TABLE quizz_question
ADD CONSTRAINT fk_to_contain_question
FOREIGN KEY(question_id)
REFERENCES question(question_id);