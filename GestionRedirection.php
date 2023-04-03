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
    require_once( "../Twig/lib/Twig/Autoloader.php" );

    include '../listeDB.inc.php';

    Twig_Autoloader::register();
    // On indique que les templates seront charges depuis ./tpl/ 
    $twig = new Twig_Environment( new Twig_Loader_Filesystem("./tpl"));

    // Chargement du template TemplateBase.tpl
    $tpl = $twig->loadTemplate( "TemplateBase.tpl" );

    // On récupère l'instance de la base de données
    $db = DB::getInstance();
    
    // On récupère les produits de la base de données
    
    $utilisateur = unserialize($_SESSION['utilisateur']);

    // generation d'une vue a partir du template
    if ( isset($_SESSION['utilisateur']) ) // lecture seule
    {
        echo $tpl->render( array(
            "titre"       => "Accueil site", // a remplacer
            "identifiant" => "", // a remplacer
            "page"        => "",
            "data"        => $db)); // a remplacer ("" = acueuil)
    }
    else // ecriture
    {
        echo $tpl->render( array(
            "titre" => "titre CV")); // a remplacer
    }
?>