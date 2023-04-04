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

    // On récupère l'identifiant
    $identifiant = $_GET['identifiant'];

    // On récupère les projet de la base de données à remplacer
    if(isset($_REQUEST['projet']))
    {
        $donnee = $db->getProjets();
        $titre = "Projet : "+$identifiant;
    }
    elseif (isset($_REQUEST['cv']))
    {
        $donnee = $db->getCV();
        $titre = "CV : "+$identifiant;
    }
    elseif (isset($_REQUEST['contact']))
    {
        $donnee = $db->getContact();
        $titre = "Contact : "+$identifiant;
    }
    elseif (isset($_REQUEST['accueil']))
    {
        $donnee = $db->getAccueil();
        $titre = "Accueil : "+$identifiant;
    }
    elseif (isset($_REQUEST['competence']))
    {
        $donnee = $db->getCompetence();
        $titre = "Competence : "+$identifiant;
    }
    elseif (isset($_REQUEST['credit'])){
        $donnee = $db->getCredit();
        $titre = "Credit : "+$identifiant;
    }
    else{
        $donnee = $db->getAccueil();
        $titre = "Accueil : "+$identifiant;
    }

    // generation d'une vue a partir du template
    if ( isset($_SESSION['utilisateur']) ) // lecture seule
    {
        $titre = "Lecture " + $titre;
        echo $tpl->render( array(
            "titre"       => $titre, // a remplacer
            "typeLecture" => "lecture",
            "identifiant" => $identifiant,
            "page"        => "", // a remplacer
            "data"        => $donnee)); 
    }
    else // ecriture
    {
        $titre = "Edition " + $titre;
        echo $tpl->render( array(
            "titre"       => $titre, // a remplacer
            "typeLecture" => "edition",
            "identifiant" => $identifiant,
            "page"        => "", // a remplacer
            "data"        => $donnee));
    }
?>