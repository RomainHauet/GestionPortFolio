DROP TABLE IF EXISTS Utilisateur CASCADE;

DROP TABLE IF EXISTS Projet CASCADE;

CREATE TABLE Utilisateur (
	id DECIMAL(10,0) PRIMARY KEY,
	nom VARCHAR(20),
	password VARCHAR(20));

CREATE TABLE Competence(
	id DECIMAL(10,0) PRIMARY KEY,
	Utilisateur DECIMAL(10,0) REFERENCES Utilisateur(id),
	nom VARCHAR(20),
	description VARCHAR(500)
);

CREATE TABLE Projet (
	id DECIMAL(10,0) PRIMARY KEY,
	utilisateur DECIMAL(10,0) REFERENCES Utilisateur(id),
	nom VARCHAR(20),
	image VARCHAR(500),
	description VARCHAR(500)
);

CREATE TABLE Tache(
	id DECIMAL(10,0) PRIMARY KEY,
	projet DECIMAL(10,0) REFERENCES Projet(id),
	competence DECIMAL(10,0) REFERENCES Competence(id)
);

INSERT INTO	Utilisateur	VALUES	(1, 'LIAM', '123');
INSERT INTO	utilisateur	VALUES	(2, 'ROMAIN', '123');
INSERT INTO	utilisateur	VALUES	(3, 'LOGANN', '123');
INSERT INTO	utilisateur	VALUES	(4, 'HUGO', '123');


INSERT INTO
	Projet
VALUES
(
		1
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
		1,
		SELECT id FROM Utilisateur WHERE nom = 'ROMAIN',
		'Serpent numérique',
		'Serpent.txt',
		'creer le jeu prefere de plp.',
		'dessin et compter jusqu’a 21'
	);

INSERT INTO
	Projet
VALUES	
(
		2,
		SELECT id FROM Utilisateur WHERE nom = 'LOGANN',
		'Le jeu de la vie',
		'JeuDeLaVie.txt',
		'creer le jeu de la vie',
		'compter jusqu’a 8'
	);

INSERT INTO
	Projet
VALUES
(
		3,
		SELECT id FROM Utilisateur WHERE nom = 'HUGO',
		'Anoui',
		'Anoui.txt',
		'creer le jeu Anoui',
		'compter jusqu’a 2'
	);

INSERT INTO
	Competence
VALUES
(
		1,
		SELECT id FROM Utilisateur WHERE nom = 'LIAM',
		'Java',
		'creer le jeu les aventurier du rail',
		'massage'
	);

INSERT INTO
	Competence
VALUES
(
		2,
		SELECT id FROM Utilisateur WHERE nom = 'ROMAIN',
		'Java',
		'creer le jeu prefere de plp.',
		'dessin et compter jusqu’a 21'
	);

INSERT INTO
	Competence
VALUES
(
		3,
		SELECT id FROM Utilisateur WHERE nom = 'LOGANN',
		'Java',
		'creer le jeu de la vie',
		'compter jusqu’a 8'
	);


INSERT INTO
	Tache
VALUES
(
		1,
		SELECT id FROM Projet WHERE nom = 'Les Aventuriers du rail',
		SELECT id FROM Competence WHERE nom = 'Java'
	);

INSERT INTO
	Tache
VALUES
(
		2,
		SELECT id FROM Projet WHERE nom = 'Serpent numérique',
		SELECT id FROM Competence WHERE nom = 'Java'
	);

INSERT INTO
	Tache
VALUES
(
		3,
		SELECT id FROM Projet WHERE nom = 'Le jeu de la vie',
		SELECT id FROM Competence WHERE nom = 'Java'
	);


INSERT INTO
	Tache
VALUES
(
		4,
		SELECT id FROM Projet WHERE nom = 'Les Aventuriers du rail',
		SELECT id FROM Competence WHERE nom = 'Travail en équipe'
	);

INSERT INTO
	Tache
VALUES
(
		5,
		SELECT id FROM Projet WHERE nom = 'Serpent numérique',
		SELECT id FROM Competence WHERE nom = 'Travail en équipe'
	);

INSERT INTO
	Tache
VALUES
(
		6,
		SELECT id FROM Projet WHERE nom = 'Le jeu de la vie',
		SELECT id FROM Competence WHERE nom = 'Travail en équipe'
	);