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
        case "Accueil" :
        {
            $db->addUtilisateur(
                $_REQUEST['identifiant'],
                $_REQUEST['nom'],
                $_REQUEST['prenom'],
                $_REQUEST['age'],
                $_REQUEST['description'],
                $_REQUEST['photo']
            );
            break;
        }
        case "Credits" :
        {
            $db->addCredits(
                $_REQUEST['identifiant'],
                $_REQUEST['noms'],
                $_REQUEST['listeCopyright']
            );
            break;
        }

        case "Projet" :
        {
            if($_REQUEST['action'] == "ajouter")
            {
                $db->addProjet(
                    $_REQUEST['identifiant'],
                    $_REQUEST['nom'],
                    $_REQUEST['image'],
                    $_REQUEST['description']
                );
                break;
            }
            else if($_REQUEST['action'] == "modifier")
            {
                $db->updateProjet(
                    $_REQUEST['identifiant'],
                    $_REQUEST['nom'],
                    $_REQUEST['image'],
                    $_REQUEST['description']
                );
                break;
            }
            else if($_REQUEST['action'] == "supprimer")
            {
                $db->deleteProjet(
                    $_REQUEST['identifiant']
                    $_REQUEST['nom'],
                    $_REQUEST['image'],
                    $_REQUEST['description']
                );
                break;
            }
        }

        case "Competence" :
        {
            if($_REQUEST['action'] == "ajouter")
            {
                $db->addCompetence(
                    $_REQUEST['identifiant'],
                    $_REQUEST['nom'],
                    $_REQUEST['image'],
                    $_REQUEST['description']
                );
                break;
            }
            else if($_REQUEST['action'] == "modifier")
            {
                $db->updateCompetence(
                    $_REQUEST['identifiant'],
                    $_REQUEST['nom'],
                    $_REQUEST['image'],
                    $_REQUEST['description']
                );
                break;
            }
            else if($_REQUEST['action'] == "supprimer")
            {
                $db->deleteCompetence(
                    $_REQUEST['identifiant']
                    $_REQUEST['nom'],
                    $_REQUEST['image'],
                    $_REQUEST['description']
                );
                break;
            }
        }

        case "Contact" :
        {
            $db->addContact(
                $_REQUEST['identifiant'],
                $_REQUEST['numerotel'],
                $_REQUEST['lienLinkedin'],
                $_REQUEST['mail']
            );
            break;
        }
    }


?>