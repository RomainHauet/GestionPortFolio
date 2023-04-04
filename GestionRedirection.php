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

    // On récupère l'identifiant et si on peut récupérer un mot de passe alors on sérialise l'utilisateur
    $identifiant = $_REQUEST['identifiant'];
    if(isset($_REQUEST['motDePasse']))
    {
        $motDePasse = $_REQUEST['motDePasse'];
        $utilisateur = $db->getUtilisateur($identifiant, $motDePasse);
        if($utilisateur != null)
        {
            $_SESSION['utilisateur'] = serialize($utilisateur);
        }
    }

    // On récupère les projet de la base de données à remplacer
    if(isset($_REQUEST['page']))
    {
        switch ($_REQUEST['page'])
        {
            case 'accueil':
                $donnee = $db->getAccueil();
                $titre = "Accueil : "+$identifiant;
                $page = "accueil";
                break;
            case 'competence':
                $donnee = $db->getCompetence();
                $titre = "Competence : "+$identifiant;
                $page = "competences";
                break;
            case 'projet':
                $donnee = $db->getProjets();
                $titre = "Projet : "+$identifiant;
                $page = "projet";
                break;
            case 'cv':
                $donnee = $db->getCV();
                $titre = "CV : "+$identifiant;
                $page = "cv";
                break;
            case 'contact':
                $donnee = $db->getContact();
                $titre = "Contact : "+$identifiant;
                $page = "contact";
                break;
            case 'credit':
                $donnee = $db->getCredit();
                $titre = "Credit : "+$identifiant;
                $page = "credit";
                break;
        }
    }

    // generation d'une vue a partir du template
    if ( isset($_SESSION['utilisateur']) ) // lecture seule
    {
        $titre = "Lecture " + $titre;
        echo $tpl->render( array(
            "titre"       => $titre,
            "typeLecture" => "lecture",
            "identifiant" => $identifiant,
            "page"        => $page,
            "data"        => $donnee)); 
    }
    else // ecriture
    {
        $titre = "Edition " + $titre;
        echo $tpl->render( array(
            "titre"       => $titre,
            "typeLecture" => "edition",
            "identifiant" => $identifiant,
            "page"        => $page,
            "data"        => $donnee));
    }
?>