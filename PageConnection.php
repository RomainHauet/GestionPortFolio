<?php
    // Path: PageConnection.php

    // pour pouvoir utiliser le loader de twig
    require_once( "../Twig/lib/Twig/Autoloader.php" );

    Twig_Autoloader::register();
    // On indique que les templates seront charges depuis ./tpl/
    $twig = new Twig_Environment( new Twig_Loader_Filesystem("./tpl"));

    // Chargement du template TemplateBase.tpl
    $tpl = $twig->loadTemplate( "TemplateBase.tpl" );

    // generation d'une vue a partir du template
    echo $tpl->render( array( "titre" => "Accueil du site")); // a remplacer ("" = acueuil du site)
?>