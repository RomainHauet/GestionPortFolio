<?php
    // Affiche les erreurs
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

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
    $utlisateur = $db->getUtilisateurs();

    // generation d'une vue a partir du template
    echo $tpl->render( array(
        "titre" => "Accueil du site",
        "Utilisateurs" => $utlisateur));
?>