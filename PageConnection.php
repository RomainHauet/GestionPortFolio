<?php
    // Path: PageConnection.php

    // pour pouvoir utiliser le loader de twig
    require_once( "./Twig/lib/Twig/Autoloader.php" );

    include './listeDB.inc.php';

    Twig_Autoloader::register();
    // On indique que les templates seront charges depuis ./tpl/
    $twig = new Twig_Environment( new Twig_Loader_Filesystem("./tpl"));

    // Chargement du template TemplateBase.tpl
    $tpl = $twig->loadTemplate( "TemplateBase.tpl" );

    // On récupère l'instance de la base de données
    $db = DB::getInstance();

    // On récupère les projet de la base de données
    switch($_REQUEST)
    {
        case isset($_REQUEST['projet']):
            $projet = $db->getProjets();
            break;

        case isset($_REQUEST['cv']):
            $CV = $db->getCV();
            break;

        case isset($_REQUEST['contact']):
            $projet = $db->getContact();
            break;

        case isset($_REQUEST['accueil']):
            $projet = $db->getAccueil();
            break;

        case isset($_REQUEST['competence']):
            $projet = $db->getCompetence();
            break;
        case isset($_REQUEST['credit']):
            $projet = $db->getCredit();
            break;
    }

    // generation d'une vue a partir du template
    echo $tpl->render( array(
        "titre" => "Accueil du site",
        "typeLecture" => "lecture",
        "projets" => $projet)); // a remplacer
?>