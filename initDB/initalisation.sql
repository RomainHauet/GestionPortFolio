DROP TABLE IF EXISTS Utilisateur CASCADE;
DROP TABLE IF EXISTS Projet CASCADE;
DROP TABLE IF EXISTS Competence CASCADE;
DROP TABLE IF EXISTS Tache CASCADE;
DROP TABLE IF EXISTS CV CASCADE;
DROP TABLE IF EXISTS Contact CASCADE;
DROP TABLE IF EXISTS Credit CASCADE;

CREATE TABLE Utilisateur (
	id VARCHAR(20) PRIMARY KEY,
	nom VARCHAR(20),
	prenom VARCHAR(20),
	password VARCHAR(20),
	description VARCHAR(500),
	etude VARCHAR(50)
);

CREATE TABLE Projet (
	id DECIMAL(10,0) PRIMARY KEY,
	utilisateur VARCHAR REFERENCES Utilisateur(id),
	nom VARCHAR(30),
	image VARCHAR(500),
	description VARCHAR(500)
);

CREATE TABLE Competence(
	id DECIMAL(10,0) PRIMARY KEY,
	Utilisateur VARCHAR REFERENCES Utilisateur(id),
	nom VARCHAR(20),
	description VARCHAR(500)
);

CREATE TABLE CV (
	utilisateur VARCHAR REFERENCES Utilisateur(id) PRIMARY KEY,
	nom VARCHAR(30),
	prenom VARCHAR(30),
	age DECIMAL(10,0),
	description VARCHAR(500),
	formation VARCHAR(500),
	lienPhotoCV VARCHAR(500),
	competence VARCHAR(500),
	projet VARCHAR(500)
);

CREATE TABLE Contact (
	utilisateur VARCHAR REFERENCES Utilisateur(id) PRIMARY KEY,
	numerotel DECIMAL(10,0),
	lienLinkedin VARCHAR(100),
	mail VARCHAR(100)
);

CREATE TABLE Tache(
	id DECIMAL(10,0) PRIMARY KEY,
	projet DECIMAL(10,0) REFERENCES Projet(id),
	competence DECIMAL(10,0) REFERENCES Competence(id)
);

CREATE TABLE Credit (
	utilisateur VARCHAR REFERENCES Utilisateur(id),
	noms VARCHAR(100),
	prenom VARCHAR(100),
	listeCopyright VARCHAR(500)
);

INSERT INTO	utilisateur	VALUES	( 'LIAM', 'Deniau', 'Liam', '123', 'je suis un etudiant en informatique', 'je suis en machin année');
INSERT INTO	utilisateur	VALUES	( 'ROMAIN', 'Hauet', 'Romain', '123', 'je suis un etudiant en informatique', 'je suis en machin année');
INSERT INTO	utilisateur	VALUES	( 'LOGANN', 'Gouley', 'Logann', '123', 'je suis un etudiant en informatique', 'je suis en machin année');
INSERT INTO	utilisateur	VALUES	( 'HUGO', 'Tassery', 'Hugo', '123', 'je suis un etudiant en informatique', 'je suis en machin année');


INSERT INTO Projet VALUES (1,'LIAM'  ,'Les Aventuriers du rail','Lia.txt'       ,'creer le jeu les aventurier du rail massage'             );
INSERT INTO Projet VALUES (2,'ROMAIN','Serpent numérique'      ,'Serpent.txt'   ,'creer le jeu prefere de plp dessin et compter jusqu’a 21');
INSERT INTO	Projet VALUES (3,'LOGANN','Le jeu de la vie'       ,'JeuDeLaVie.txt','creer le jeu de la vie compter jusqu’a 8'                );
INSERT INTO Projet VALUES (4,'HUGO'  ,'Anoui'                  ,'Anoui.txt'     ,'creer le jeu Anoui compter jusqu’a 2'                    );

INSERT INTO Competence VALUES (1,'LIAM'  ,'Java','creer le jeu les aventurier du rail massage'              );
INSERT INTO Competence VALUES (2,'LIAM'  ,'C#','creer un jeu bien'                                          );
INSERT INTO Competence VALUES (3,'ROMAIN','Java','creer le jeu prefere de plp. dessin et compter jusqu’a 21');
INSERT INTO Competence VALUES (4,'LOGANN','Java','creer le jeu de la vie compter jusqu’a 8'                 );
INSERT INTO Competence VALUES (5,'HUGO'  ,'Java','creer le jeu Anoui compter jusqu’a 2'                     );

INSERT INTO Tache VALUES (1,(SELECT id FROM Projet WHERE nom = 'Les Aventuriers du rail'),(SELECT DISTINCT id FROM Competence WHERE nom = 'Java' AND id = 1));
INSERT INTO Tache VALUES (2,(SELECT id FROM Projet WHERE nom = 'Serpent numérique'),(SELECT id FROM Competence WHERE nom = 'Java' and id = 2));
INSERT INTO Tache VALUES (3,(SELECT id FROM Projet WHERE nom = 'Le jeu de la vie'),(SELECT DISTINCT id FROM Competence WHERE nom = 'Java' AND id = 3));
INSERT INTO Tache VALUES (4,(SELECT id FROM Projet WHERE nom LIKE 'Les Aventuriers du rail'),(SELECT id FROM Competence WHERE nom LIKE 'Travail en équipe'));
INSERT INTO Tache VALUES (5,(SELECT id FROM Projet WHERE nom LIKE 'Serpent numérique'),(SELECT id FROM Competence WHERE nom LIKE 'Travail en équipe'));
INSERT INTO Tache VALUES (6,(SELECT id FROM Projet WHERE nom LIKE 'Le jeu de la vie'),(SELECT id FROM Competence WHERE nom LIKE 'Travail en équipe'));

INSERT INTO CV VALUES ('LIAM','Deniau','LIAM',26,'description liam genre toute ma vie c est incroyable je suis le boss ca marche whouhou yes trop bien c est genial','photo liam','experience Liam','competence liam','diplome Liam');
INSERT INTO CV VALUES ('ROMAIN','HAUET','ROMAIN',23,'description romain','photo Romain','experience Romain','competence romain','diplome romain');

INSERT INTO Contact VALUES ('LIAM',0771613722,'lienLinkedinL','Liam.deniau@free.fr');
INSERT INTO Contact VALUES ('ROMAIN',0656565656,'lienLinkedinR','Romainh@free.fr');

INSERT INTO Credit VALUES ('LIAM','nom','prenom','listeCopyright');
INSERT INTO Credit VALUES ('ROMAIN','nom','prenom','listeCopyright');