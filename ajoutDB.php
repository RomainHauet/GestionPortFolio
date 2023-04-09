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

    // pour pouvoir utiliser le loader de twig
    require_once( "./Twig/lib/Twig/Autoloader.php" );

    Twig_Autoloader::register();
    // On indique que les templates seront charges depuis ./tpl/ 
    $twig = new Twig_Environment( new Twig_Loader_Filesystem("./tpl"));

    // Chargement du template TemplateBase.tpl
    $tpl = $twig->loadTemplate( "TemplateBase.tpl" );

    // On récupère l'instance de la base de données
    $db = DB::getInstance();

    // On récupère les informations de l'utilisateur
    $utilisateur = $db->getUtilisateur($_SESSION['identifiant']);

    // On récupère les informations du CV
    $cv = $db->getCV($_SESSION['identifiant']);
    $credits = $db->getCredits($_SESSION['identifiant']);
    $contact = $db->getContact($_SESSION['identifiant']);
    $projets = $db->getProjets($_SESSION['identifiant']);
    $competences = $db->getCompetences($_SESSION['identifiant']);

    // Generation d'une vue a partir du template
    echo $tpl->render( array(
        "titre"        => $titre,
        "typeLecture"  => "Ecriture",
        "identifiant"  => $identifiant,
        "page"         => $page,
        "Projets"      => $projets,
        "Competences"  => $competences,
        "CV"           => $cv,
        "Contacts"     => $contacts,
        "Credits"      => $credits,
        "Utilisateur"  => $utilisateur
    ));

?>