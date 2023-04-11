<?php
    // Affiche les erreurs
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    if($_SERVER["REQUEST_METHOD"] != "POST") // a remplacer par une connection existante si et le mode ecriture
    {
        header('Location: PageConnection.php');
        exit();
    }
    
    include './listeDB.inc.php';

    // on ajoute les information recu dans la base de données
    $db = DB::getInstance();

    switch($_POST['page'])
    {
        case "Accueil" :
        {
            $password = $db->getPassword($_REQUEST['identifiant']);
            $db->addUtilisateur(
                $_REQUEST['identifiant'],
                $_REQUEST['nom'],
                $_REQUEST['prenom'],
                $password,
                $_REQUEST['description'],
                $_REQUEST['etude'],
                $_REQUEST['liens']
            );
            break;
        }
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
        case "Credits" :
        {
            $db->addCredit(
                $_REQUEST['identifiant'],
                $_REQUEST['noms'],
                $_REQUEST['listeCopyright']
            );
            break;
        }

        case "Projets" :
        {
            print_r($_REQUEST['action']);
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
                    $_REQUEST['id'],
                    $_REQUEST['nom'],
                    $_REQUEST['image'],
                    $_REQUEST['description']
                );
                break;
            }
            else if($_REQUEST['action'] == "supprimer")
            {
                print_r("Supprimer");
                $db->deleteProjet(
                    $_REQUEST['id']
                );
                break;
            }
        }

        case "Competences" :
        {
            if($_REQUEST['action'] == "ajouter")
            {
                $db->addCompetence(
                    $_REQUEST['identifiant'],
                    $_REQUEST['nom'],
                    $_REQUEST['description']
                );
                break;
            }
            else if($_REQUEST['action'] == "modifier")
            {
                $db->updateCompetence(
                    $_REQUEST['id'],
                    $_REQUEST['nom'],
                    $_REQUEST['description']
                );
                break;
            }
            else if($_REQUEST['action'] == "supprimer")
            {
                $db->deleteCompetence(
                    $_REQUEST['id'],
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

    $identifiant = $_REQUEST['identifiant'];
    $typeLecture = "edition";
    $page = $_REQUEST['page'];
    $titre = $typeLecture." ".$page." : ".$identifiant;
    // On récupère les informations de l'utilisateur
    $utilisateur = $db->getUtilisateur($_REQUEST['identifiant']);

    // On récupère les informations du CV
    $cv = $db->getCV($_REQUEST['identifiant']);
    $credits = $db->getCredit($_REQUEST['identifiant']);
    $contacts = $db->getContact($_REQUEST['identifiant']);
    $projets = $db->getProjet($_REQUEST['identifiant']);
    $competences = $db->getCompetence($_REQUEST['identifiant']);

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
        "Utilisateur"  => $utilisateur,
    ));

?>