drop table if exists utilisateur cascade;
drop table if exists projet cascade;

create table utilisateur(
    nom varchar(20),
    password varchar(20)
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