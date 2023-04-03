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

    echo "<form> <div class="row"> <div class="six columns">";
    echo "label for="identifiant">Identifiant</label>";
    echo "input class="u-full-width" type="text" placeholder="identifiant" id="identifiant">";
    echo "</div> </div> <div class="row"> <div class="six columns">";
    echo "label for="motdepasse">Mot de passe</label>";
    echo "input class="u-full-width" type="password" placeholder="mot de passe" id="motdepasse">";
    echo "</div> </div> <input class="button-primary" type="submit" value="Se connecter"> </form>";
?>