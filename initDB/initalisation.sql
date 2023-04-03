DROP TABLE IF EXISTS Utilisateur CASCADE;
DROP TABLE IF EXISTS Projet CASCADE;

CREATE TABLE Utilisateur
(
  nom VARCHAR(20),
  password VARCHAR(20)
);

create table projet(
    utilisateur varchar(20),
    nom varchar(20),
    image varchar(500),
    description varchar(500),
    competence varchar(500)
);

insert into utilisateur values(
    "LIAM",
    "123"
);

insert into utilisateur values(
    "ROMAIN",
    "123"
);

insert into projet values(
    "LIAM",
    "Les Aventuriers du rails de coke",
    "Lia.txt",
    "creer le jeu les aventurier du rail",
    "massage"
);

insert into projet values(
    "ROMAIN",
    "Serpent numérique",
    "Bite.txt",
    "creer le jeu prefere de plp ou se tailler les veines",
    "dessin et compter jusque 21"
);
CREATE TABLE Projet
(
  utilisateur VARCHAR(20),
  nom VARCHAR(20),
  image VARCHAR(500),
  description VARCHAR(500),
  competence VARCHAR(500)
);

INSERT INTO Utilisateur VALUES('LIAM',   '123');
INSERT INTO utilisateur VALUES('ROMAIN', '123');

INSERT INTO Projet VALUES('LIAM',   'Les Aventuriers du rail', 'Lia.txt',     'creer le jeu les aventurier du rail', 'massage');
INSERT INTO Projet VALUES('ROMAIN', 'Serpent numérique',       'Serpent.txt', 'creer le jeu prefere de plp.',        'dessin et compter jusqu’a 21');
