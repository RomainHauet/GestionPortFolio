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

    // on ajoute les information recu dans la base de données
    $db = DB::getInstance();

    switch($_POST['page'])
    {
        case "CV" :
            {
                $db->addCV(
                    $_REQUEST['identifiant'],
                    $_REQUEST['nom'],
                    $_REQUEST['prenom'],
                    $_REQUEST['age'],
                    $_REQUEST['description'],
                    $_REQUEST['formation'],
                    $_REQUEST['photo'],
                    $_REQUEST['competences'],
                    $_REQUEST['projets']
                );
                break;
            }
    }
?>