DROP TABLE IF EXISTS Utilisateur CASCADE;
DROP TABLE IF EXISTS Projet CASCADE;

create table Utilisateur
(
  nom VARCHAR(20),
  password VARCHAR(20)
);

create table projet(
    utilisateur varchar(20),
    nom varchar(50),
    image varchar(500),
    description varchar(500),
    competence varchar(500)
);

insert into utilisateur values(
    'LIAM',
    '123'
);

insert into utilisateur values(
    'ROMAIN',
    '123'
);

insert into projet values(
    'LIAM',
    'Les Aventuriers du rails de coke',
    'Lia.txt',
    'creer le jeu les aventurier du rail',
    'massage'
);

insert into projet values(
    'ROMAIN',
    'Serpent numérique',
    'Bite.txt',
    'creer le jeu prefere de plp ou se tailler les veines',
    'dessin et compter jusque 21'
);