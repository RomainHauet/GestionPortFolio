<?php
    // Affiche les erreurs
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    if($_SERVER["REQUEST_METHOD"] != "POST") // a remplacer par une connection existante si et le mode ecriture
    {
        header('Location: PageConnection.php');
        exit();
    }

    // on ajoute les information recu dans la base de données
    $db = DB::getInstance();

    
?>