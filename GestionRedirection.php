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
    
    if(isset($_REQUEST['motdepasse']))
    {
        $motDePasse = $_REQUEST['motdepasse'];

        // On verifie qu'il existe et on verifie que le mot de passe et valide
        if(!$db->verifierUtilisateur($identifiant, $motDePasse))
        {
            $utilisateur = $db->getUtilisateurs();
            echo $tpl->render( array(
                "titre" => "Accueil du site",
                "Utilisateurs" => $utilisateur,
                "erreur" => "Identifiant ou mot de passe invalide"));
        }
        
        // Vu qu'il y a un mot de passe on est en mode edition
        $titre = "Edition ";
        $typeLecture = "edition";

        // On récupère l'utilisateur
        $utilisateur = $db->getUtilisateur($identifiant, $motDePasse);
        $_SESSION['utilisateur'] = serialize($utilisateur);
    }
    else
    {
        if(isset($_REQUEST['typeLecture']))
        {
            switch($_REQUEST['typeLecture'])
            {
                case "lecture":
                    $titre = "Lecture ";
                    break;
                case "edition":
                    $titre = "Edition ";
            }
            $typeLecture = $_REQUEST['typeLecture'];
        }
        else
        {
            $titre = "Lecture ";
            $typeLecture = "lecture";
        }
    }

    // On récupère les données de la base de données à remplacer
    $utilisateur = $db->getUtilisateur($identifiant);
    $projets = $db->getProjet($identifiant);
    $competences = $db->getCompetence($identifiant);
    $cv = $db->getCV($identifiant);
    $contacts = $db->getContact($identifiant);
    $credits = $db->getCredit($identifiant);
    
    
    // On renomme les variables titre et page
    $page = $_REQUEST['page'];
    $titre = $titre.$page." : ".$identifiant;
    
    // Generation d'une vue a partir du template
    echo $tpl->render( array(
        "titre"        => $titre,
        "typeLecture"  => $typeLecture,
        "identifiant"  => $identifiant,
        "page"         => $page,
        "Projets"      => $projets,
        "Competences"  => $competences,
        "CV"           => $cv,
        "Contacts"     => $contacts,
        "Credits"      => $credits,
        "Utilisateurs" => $utilisateur
    ));
?>