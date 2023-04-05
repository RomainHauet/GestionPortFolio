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

    // On récupère les données de la base de données à remplacer
    $projet = $db->getProjet($identifiant);
    $competence = $db->getCompetence($identifiant);
    $cv = $db->getCV($identifiant);
    $contact = $db->getContact($identifiant);
    $credit = $db->getCredit($identifiant);

    // On renomme les variables titre et page
    if(isset($_REQUEST['page']))
    {
        switch ($_REQUEST['page'])
        {
            case 'accueil':
                $titre = "Accueil : ".$identifiant;
                $page = "accueil";
                break;
            case 'competence':
                $titre = "Competence : ".$identifiant;
                $page = "competences";
                break;
            case 'projet':
                $titre = "Projet : ".$identifiant;
                $page = "projet";
                break;
            case 'cv':
                $titre = "CV : ".$identifiant;
                $page = "cv";
                break;
            case 'contact':
                $titre = "Contact : ".$identifiant;
                $page = "contact";
                break;
            case 'credit':
                $titre = "Credit : ".$identifiant;
                $page = "credit";
                break;
        }
    }
    
    // generation d'une vue a partir du template
    if ( isset($_SESSION['utilisateur']) ) // edition
    {
        $titre = "Edition ".$titre;
        echo $tpl->render( array(
            "titre"       => $titre,
            "typeLecture" => "edition",
            "identifiant" => $identifiant,
            "page"        => $page,
            "projet"      => $projet,
            "competence"  => $competence,
            "cv"          => $cv,
            "contact"     => $contact,
            "credit"      => $credit)); 
    }
    else // lecture seule
    {
        $titre = "Lecture ".$titre;
        echo $tpl->render( array(
            "titre"       => $titre,
            "typeLecture" => "lecture",
            "identifiant" => $identifiant,
            "page"        => $page,
            "projet"      => $projet,
            "competence"  => $competence,
            "cv"          => $cv,
            "contact"     => $contact,
            "credit"      => $credit));
    }
?>