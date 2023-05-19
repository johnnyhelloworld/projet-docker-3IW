CREATE USER test WITH PASSWORD 'test123';

CREATE DATABASE db OWNER test;

-- Création de la table todos
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    done BOOLEAN NOT NULL
);

-- Insertion des lignes de données
INSERT INTO todos (titre, done) VALUES ('Faire les courses', false);
INSERT INTO todos (titre, done) VALUES ('Appeler le médecin', true);
INSERT INTO todos (titre, done) VALUES ('Faire du sport', false);
INSERT INTO todos (titre, done) VALUES ('Terminer le rapport', false);
INSERT INTO todos (titre, done) VALUES ('Préparer le dîner', true);
INSERT INTO todos (titre, done) VALUES ('Répondre aux e-mails', false);
INSERT INTO todos (titre, done) VALUES ('Faire la lessive', true);
INSERT INTO todos (titre, done) VALUES ('Planifier les vacances', false);
INSERT INTO todos (titre, done) VALUES ('Lire un livre', false);
INSERT INTO todos (titre, done) VALUES ('Rencontrer des amis', true);
