DROP TABLE IF EXISTS Utilisateur CASCADE;

DROP TABLE IF EXISTS Projet CASCADE;

CREATE TABLE Utilisateur (
	id DECIMAL(10,0) PRIMARY KEY,
	nom VARCHAR(20),
	password VARCHAR(20));

CREATE TABLE Projet (
	utilisateur DECIMAL(10,0) REFERENCES Utilisateur(id),
	nom VARCHAR(20),
	image VARCHAR(500),
	description VARCHAR(500),
	competence VARCHAR(500)
);

INSERT INTO
	Utilisateur
VALUES
(1, 'LIAM', '123');

INSERT INTO
	utilisateur
VALUES
(2, 'ROMAIN', '123');

INSERT INTO
	Projet
VALUES
(
		SELECT id FROM Utilisateur WHERE nom = 'LIAM',
		'Les Aventuriers du rail',
		'Lia.txt',
		'creer le jeu les aventurier du rail',
		'massage'
	);

INSERT INTO
	Projet
VALUES
(
		SELECT id FROM Utilisateur WHERE nom = 'ROMAIN',
		'Serpent numérique',
		'Serpent.txt',
		'creer le jeu prefere de plp.',
		'dessin et compter jusqu’a 21'
	);