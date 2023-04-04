<?php

    // Affiche les erreurs
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    if($_SERVER["REQUEST_METHOD"] != "POST") // a remplacer par une connection existante si et le mode ecriture
    {
        header('Location: PageConnection.php');
        exit();
    }

    session_start();

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

    // On récupère les projet de la base de données à remplacer
    switch($_REQUEST)
    {
        case isset($_REQUEST['projet']):
            $donnee = $db->getProjets();
            break;

        case isset($_REQUEST['cv']):
            $donnee = $db->getCV();
            break;

        case isset($_REQUEST['contact']):
            $donnee = $db->getContact();
            break;

        case isset($_REQUEST['accueil']):
            $donnee = $db->getAccueil();
            break;

        case isset($_REQUEST['competence']):
            $donnee = $db->getCompetence();
            break;

        case isset($_REQUEST['credit']):
            $donnee = $db->getCredit();
            break;
        default:
            header('Location: PageConnection.php');
            exit();
    }

    // generation d'une vue a partir du template
    if ( isset($_SESSION['utilisateur']) ) // lecture seule
    {
        echo $tpl->render( array(
            "titre"       => "Accueil site", // a remplacer
            "typeLecture" => "lecture",
            "identifiant" => "", // a remplacer
            "page"        => "", // a remplacer
            "data"        => $donnee)); 
    }
    else // ecriture
    {
        echo $tpl->render( array(
            "titre" => "Site edition", // a remplacer
            "typeLecture" => "edition",
            "identifiant" => "", // a remplacer
            "page"        => "", // a remplacer
            "data"        => $donnee));
    }
?>