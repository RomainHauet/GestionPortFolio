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
	etude VARCHAR(500),
	liens VARCHAR(500)
);

CREATE TABLE Projet (
	id INT PRIMARY KEY,
	utilisateur VARCHAR REFERENCES Utilisateur(id),
	nom VARCHAR(50),
	image VARCHAR(500),
	description VARCHAR(500)
);

CREATE TABLE Competence(
	id INT PRIMARY KEY,
	Utilisateur VARCHAR REFERENCES Utilisateur(id),
	nom VARCHAR(500),
	description VARCHAR(500)
);

CREATE TABLE CV (
	utilisateur VARCHAR REFERENCES Utilisateur(id) PRIMARY KEY,
	nom VARCHAR(30),
	prenom VARCHAR(30),
	age DECIMAL(10,0),
	description VARCHAR(1000),
	formation VARCHAR(1000),
	lienPhotoCV VARCHAR(1000),
	competence VARCHAR(1000),
	projet VARCHAR(1000)
);

CREATE TABLE Contact (
	utilisateur VARCHAR REFERENCES Utilisateur(id) PRIMARY KEY,
	numerotel DECIMAL(10,0),
	lienLinkedin VARCHAR(100),
	mail VARCHAR(100)
);

CREATE TABLE Tache(
	id INT PRIMARY KEY,
	projet  SMALLSERIAL REFERENCES Projet(id),
	competence  SMALLSERIAL REFERENCES Competence(id)
);

CREATE TABLE Credit (
	utilisateur VARCHAR REFERENCES Utilisateur(id),
	noms VARCHAR(100),
	listeCopyright VARCHAR(500)
);


/* DATA Romain */
INSERT INTO utilisateur	VALUES
(
    'ROMAIN',
    'Hauet',
    'Romain',
    '123',
    'Etudiant IUT Le Havre',
    '2ème année',
    'https://www.linkedin.com/in/romain-hauet-1b1b3a1a3/'
);

INSERT INTO Projet VALUES
(
    50,
    'ROMAIN',
    'Serpent numérique',
    'Serpent.png',
    'Le but de jeu est de placer correctement les nombres proposés du plus petit au plus grand alors que les nombres arrivent successivement. A la fin de la partie on compte toutes nos séries et ca longueur, Plus la série est grande plus elle rapporte de point. Celui qui a le plus de points gagne la partie'
);

INSERT INTO Projet VALUES
(
    51,
    'ROMAIN',
    'La conquête de Splendor',
    'Splendor.png',
    'Jeu de plateau sur lequel on doit conquérir des territoires contenant des minerai, le but final est d’obtenir le plus de points quon obtiens avec 2 méthodes : en prenant possession d’un territoire ou réalisant des objectifs.'
);

INSERT INTO Projet VALUES
(
    52,
    'ROMAIN',
    'Simulateur de cuves',
    'SimulateurCuve.png',
    'Création d une application java simulant les des cylindres pouvant contenir un certaines quantité et lapplication sert à équilibrer les cuves selon la quantité de chacun'
);

INSERT INTO Projet VALUES
(
    53,
    'ROMAIN',
    'Creation un espace virtuel',
    'EspaceVirtuel.png',
    'Notre équipe avait pour objectif de créer un espace virtuel et de faire un manuel dutilisation pour que tout le monde puissent le reproduire'
);


INSERT INTO Competence VALUES
(
    50,
    'ROMAIN',
    'Satisfaire les besoins des utilisateurs au regard de la chaîne de valeur du client, organiser et piloter un projet informatique avec des méthodes classiques ou agiles',
    'Notre groupe a été charger de créer une application en java sur le jeux de plateau Splendor, nous avons dû faire un échange avec le client en plein millieu du projet pour poser des question à propos du projet et des inprécision qui sotn dessus'
);

INSERT INTO Competence VALUES
(
    51,
    'ROMAIN',
    'Création applications informatiques optimisées en fonction de critères spécifiques : temps d’exécution, précision, consommation de ressource',
    'Notre groupe a été charger de créer une application en java sur le jeux de plateau Splendor, nous avons donc dû créer un diagramme UML, puis nous avons codé en java.'
);

INSERT INTO Competence VALUES
(
    52,
    'ROMAIN',
    'Création applications informatiques optimisées en fonction de critères spécifiques : temps d’exécution, précision, consommation de ressource',
    'Notre groupe a été charger de créer une application en java sur le jeux de plateau Splendor, nous avons donc dû créer un diagramme UML, puis nous avons codé en java.'
);


INSERT INTO CV VALUES
(
    'ROMAIN',
    'HAUET',
    'Romain',
    23,
    'Je suis un étudiant en 2ème année en BUT Informatique, jai aquis une experience grâce à mes projets académiques. Je suis passioné par les nouvelles technologies et techniques, je suis contament à la recherche de nouvelle méthodes de travail',
    'Romain.png',
    'Création de jeux tel que un serpent numérique ou la conquête de splendor\n',
    'Création applications informatiques optimisées en fonction de critères spécifiques : temps d’exécution, précision, consommation de ressource\n
    Satisfaire les besoins des utilisateurs au regard de la chaîne de valeur du client, organiser et piloter un projet informatique avec des méthodes classiques ou agiles\n
    Acquérir, développer et exploiter les aptitudes nécessaires pour travailler efficacement dans une équipe informatique\n
    Installer, configurer, mettre à disposition, maintenir en conditions opérationnelles des infrastructures, des services et des réseaux et optimiser le système informatique d’une organisation',
    'BAC'
);

INSERT INTO Contact VALUES
(
    'ROMAIN',
    '0658809784',
    'https://www.linkedin.com/in/romain-hauet/',
    'hauetromain@gmail.com'
);

INSERT INTO Credit VALUES
(
    'ROMAIN',
    'Romain',
    ''
);

/* DATA Matthew */
INSERT INTO utilisateur VALUES( 'MATTHEW', 'UHL', 'Matthew', '9029', 'je suis un etudiant en informatique', 'je suis en deuxieme année', 'https://www.linkedin.com/in/matthew-uhl-653147255/');

INSERT INTO Competence VALUES (1,'MATTHEW','Java','Programmer des application en java');

INSERT INTO Projet VALUES (1,'MATTHEW'  ,'Les Aventuriers du rail','Lia.txt','creer le jeu les aventurier du rail ');
INSERT INTO Projet VALUES (2,'MATTHEW','Serpent numérique','Serpent.txt','creer le jeu de calcul');
INSERT INTO CV VALUES ('MATTHEW','UHL','MATTHEW',20,'Étudiant en B.U.T informatique je me suis dirigé dans cette filière intéressé par la programmation que j ai étudié pendant 3 ans jusque ici c est pour cela que je souhaiterais un stage qui pourras m en apprendre encore plus sur l informatique et tout les horizons explorable en cette matière.','Baccalauréat STI2D
Lycée Jules Siegfried
BUT Informatique
 IUT Le Havre','Photo-Matthew.jpg','Création de diagramme UML
Codage en JAVA
Gestion et création de base de données SQL','Projet informatique en équipe de 5 ou nous avons été mené à produire des sites web, gérer et créer des bases de données, développer des application en java tel qu une reproduction du jeu "Les aventuriers du rail" où un générateur de plateau pour le dit jeu, et même installer des machines virtuelles');
INSERT INTO Contact VALUES ('MATTHEW','0673632644','https://www.linkedin.com/in/matthew-uhl-653147255/','matthew.uhl@etu.univ-lehavre.fr');

INSERT INTO Credit VALUES ('MATTHEW','Matthew','Copyright');

/* DATA Hugo */

INSERT INTO utilisateur VALUES ('HUGOT', 'Tassery', 'Hugo', '123', 'Je suis un etudiant en informatique, cherchant à me spécialiser dans le développement objet', 'Je suis deuxième année de BUT informatique à L IUT du Havre', 'https://www.linkedin.com/in/hugo-tassery-24630a251/');

INSERT INTO projet VALUES (30, 'HUGOT', 'Serpent numérique', 'image1.png', 'adaptation du jeu du serpent en Java, avec un affichage sur la console');
INSERT INTO projet VALUES (31, 'HUGOT', 'Génération de site de ludothèque', 'image2.png', 'génération de site web en HTML pour une ludothèque à partir de Java et de tableur');
INSERT INTO projet VALUES (32, 'HUGOT', 'Création de base de données de bibliothèque', 'image3.png', 'création d’une base de données pour une bibliothèque à partir de tableur');
INSERT INTO projet VALUES (33, 'HUGOT', 'Création d’un site d’hébergement multimédia', 'image4.png', 'création à l’aide de Docker d’un site d’hébergement multimédia');
INSERT INTO projet VALUES (34, 'HUGOT', 'Simulateur de cuves', 'image5.png', 'création d’un simulateur de cuves à partir de Java dont les paramètres pouvaient être sauvegardés dans un .txt');

INSERT INTO competence VALUES (30, 'HUGOT', 'Développement d’application', 'Je suis capable de mettre à bien un projet de développement d’application, de la conception à la réalisation, comme en témoigne le projet Simulateur de cuves');
INSERT INTO competence VALUES (31, 'HUGOT', 'Optimisation de code', 'Je suis capable d’optimiser le code d’un projet, comme je l’ai fait sur le Serpent numérique');
INSERT INTO competence VALUES (32, 'HUGOT', 'Gestion de données de l’information', 'Je suis capable de gérer des données de l’information, comme je l’ai fait sur le projet de création de base de données de bibliothèque');

INSERT INTO cv VALUES ('HUGOT', 'Tassery', 'Hugo', 20, 'Je suis un étudiant en informatique, cherchant à me spécialiser dans le développement objet', 'Je suis deuxième année de BUT informatique à L’IUT du Havre', 'image1.png', 'Développement d’application, Optimisation de code, Gestion de données de l’information', 'Serpent numérique, Génération de site de ludothèque, Création de base de données de bibliothèque, Création d’un site d’hébergement multimédia, Simulateur de cuves');

INSERT INTO contact VALUES ('HUGOT', 0652744060 , 'https://www.linkedin.com/in/hugo-tassery-24630a251/', 'hugo.tassery@free.fr');

INSERT INTO credit VALUES ('HUGOT','Tassery','Hugo');

/* DATA Liam */

INSERT INTO utilisateur VALUES ('LIAM', 'Deniau', 'Liam', '123', 'Étudiant en seconde année de BUT informatique, je me suis dirigé vers la programmation afin de pouvoir satisfaire ma soif de créativité et de nouvelles technologies.', 'Deuxième année de BUT informatique à L IUT du Havre', 'https://www.linkedin.com/in/liam-deniau/');

INSERT INTO projet VALUES (100, 'LIAM', 'Serpent numérique', 'image1.png', 'Création en JAVA d un petit jeu de nombres dit du Serpent Numerique');
INSERT INTO projet VALUES (101, 'LIAM', 'Génération de site de ludothèque', 'image2.png', 'Création d une application JAVA permettant de générer un site HTML représentant une base de donnée textuelle de ludoteque');
INSERT INTO projet VALUES (102, 'LIAM', 'Création des aventuriers du rail', 'image3.png', 'Creation de deux applications : une pour générer une carte pour le jeu les aventurier du rail et un autre pour pouvoir jouer sur la carte crée (le tout en JAVA)');
INSERT INTO projet VALUES (103, 'LIAM', 'Creation d un petit jeu video', 'image4.png', 'Création a l aide du moteur de jeu Unity d un jeu video de plateforme en 2D dans le language de programmation C#');
INSERT INTO projet VALUES (104, 'LIAM', 'Simulateur de cuves', 'image5.png', 'Création d une application simulant les echanges de fluides entre des cuves de differentes tailes a partir d une matrice de cout');

INSERT INTO competence VALUES (100, 'LIAM', 'Développement d’application', 'Je suis capable de développer un projet d application grace a mon savoir faire optenu lors des projet de jeu video ou des aventurier du rail par exemple');
INSERT INTO competence VALUES (101, 'LIAM', 'Développement web', 'Je suis capable de crée un site web fonctionel en comme le montre ce portfolio et le projet de ludoteque');
INSERT INTO competence VALUES (102, 'LIAM', 'Gestion d une base de donnée', 'Je suis capable de gérer une base de donnée comme peut le prouver ce portfolio');
INSERT INTO competence VALUES (103, 'LIAM', 'Gestion d equipe', 'Je suis capable de gérer une equipe informatique et de gerer des conflits');


INSERT INTO cv VALUES ('LIAM', 'Deniau', 'Liam', 20, 'Étudiant en seconde année de BUT informatique, je me suis dirigé vers la programmation afin de pouvoir satisfaire ma soif de créativité et de nouvelles technologies.', 'Deuxième année de BUT informatique à L IUT du Havre', 'image1.png', 'Développement d’application, Optimisation de code, Gestion de données de l’information', 'Serpent numérique, Génération de site de ludothèque, Création des aventuriers du rail, Creation d un petit jeu video, Simulateur de cuves');

INSERT INTO contact VALUES ('LIAM', 0771613722 , 'https://www.linkedin.com/in/liam-deniau/', 'deniaul@free.fr');

INSERT INTO credit VALUES ('LIAM','Deniau','Liam');