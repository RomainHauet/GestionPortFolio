DROP TABLE IF EXISTS Utilisateur CASCADE;
DROP TABLE IF EXISTS Projet CASCADE;
DROP TABLE IF EXISTS Competence CASCADE;
DROP TABLE IF EXISTS Tache CASCADE;
DROP TABLE IF EXISTS CV CASCADE;
DROP TABLE IF EXISTS Contact CASCADE;

CREATE TABLE Utilisateur (
	nom VARCHAR(20) PRIMARY KEY,
	password VARCHAR(20),
	description VARCHAR(500),
	etude VARCHAR(50)
);

CREATE TABLE Competence(
	id DECIMAL(10,0) PRIMARY KEY,
	Utilisateur VARCHAR REFERENCES Utilisateur(nom),
	nom VARCHAR(20),
	description VARCHAR(500)
);

CREATE TABLE Projet (
	id DECIMAL(10,0) PRIMARY KEY,
	utilisateur VARCHAR REFERENCES Utilisateur(nom),
	nom VARCHAR(30),
	image VARCHAR(500),
	description VARCHAR(500)
);

CREATE TABLE Tache(
	id DECIMAL(10,0) PRIMARY KEY,
	projet DECIMAL(10,0) REFERENCES Projet(id),
	competence DECIMAL(10,0) REFERENCES Competence(id)
);

CREATE TABLE CV (
	id DECIMAL(10,0) PRIMARY KEY,
	utilisateur VARCHAR REFERENCES Utilisateur(nom),
	lienPhotoCV VARCHAR(100),
	experience VARCHAR(100),
	competence VARCHAR(100),
	diplome VARCHAR(100)
);

CREATE TABLE Contact (
	id DECIMAL(10,0) PRIMARY KEY,
	utilisateur VARCHAR REFERENCES Utilisateur(nom),
	numerotel NUMERIC(100),
	lienLinkedin VARCHAR(100)
);

CREATE TABLE Credit (
	id DECIMAL(10,0) PRIMARY KEY,
	utilisateur VARCHAR REFERENCES Utilisateur(nom),
	noms VARCHAR(100),
	prenom VARCHAR(100),
	listeCopyright VARCHAR(500)
);

INSERT INTO	utilisateur	VALUES	( 'LIAM', '123', 'je suis un etudiant en informatique', 'je suis en machin année');
INSERT INTO	utilisateur	VALUES	( 'ROMAIN', '123', 'je suis un etudiant en informatique', 'je suis en machin année');
INSERT INTO	utilisateur	VALUES	( 'LOGANN', '123', 'je suis un etudiant en informatique', 'je suis en machin année');
INSERT INTO	utilisateur	VALUES	( 'HUGO', '123', 'je suis un etudiant en informatique', 'je suis en machin année');


INSERT INTO Projet VALUES (
		1,
		'LIAM',
		'Les Aventuriers du rail',
		'Lia.txt',
		'creer le jeu les aventurier du rail massage'
	);

INSERT INTO
	Projet
VALUES
(
		2,
		'ROMAIN',
		'Serpent numérique',
		'Serpent.txt',
		'creer le jeu prefere de plp dessin et compter jusqu’a 21'
	);

INSERT INTO
	Projet
VALUES	
(
		3,
		'LOGANN',
		'Le jeu de la vie',
		'JeuDeLaVie.txt',
		'creer le jeu de la vie compter jusqu’a 8'
	);

INSERT INTO
	Projet
VALUES
(
		4,
		'HUGO',
		'Anoui',
		'Anoui.txt',
		'creer le jeu Anoui compter jusqu’a 2'
	);

INSERT INTO
	Competence
VALUES
(
		1,
		'LIAM',
		'Java',
		'creer le jeu les aventurier du rail massage'
	);

INSERT INTO
	Competence
VALUES
(
		2,
		'ROMAIN',
		'Java',
		'creer le jeu prefere de plp. dessin et compter jusqu’a 21'
	);

INSERT INTO
	Competence
VALUES
(
		3,
		'LOGANN',
		'Java',
		'creer le jeu de la vie compter jusqu’a 8'
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

INSERT INTO
	CV
VALUES
(
		1,
		'LIAM',
		'lienPhotoCV',
		'experience',
		'competence',
		'diplome'
	);

INSERT INTO
	CV
VALUES
(
		2,
		'ROMAIN',
		'lienPhotoCV',
		'experience',
		'competence',
		'diplome'
	);

INSERT INTO
	Contact
VALUES
(
		1,
		'LIAM',
		0656565656,
		'lienLinkedin'
	);

INSERT INTO
	Contact
VALUES
(
		2,
		'ROMAIN',
		0656565656,
		'lienLinkedin'
	);

INSERT INTO
	Credit
VALUES
(
		1,
		'LIAM',
		'nom',
		'prenom',
		'listeCopyright'
	);

INSERT INTO
	Credit
VALUES
(
		2,
		'ROMAIN',
		'nom',
		'prenom',
		'listeCopyright'
	);