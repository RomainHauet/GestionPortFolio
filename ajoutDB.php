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

    $requete =
    "INSERT INTO CV (nom, prenom, age, description, formation, competences, projets)
    VALUES (:nom, :prenom, :age, :description, :formation, :competences, :projets)";

    $stmt = $db->connect->prepare($requete);

    $stmt->bindParam(':nom', $_POST['nom']);
    $stmt->bindParam(':prenom', $_POST['prenom']);
    $stmt->bindParam(':age', $_POST['age']);
    $stmt->bindParam(':description', $_POST['description']);
    $stmt->bindParam(':formation', $_POST['formation']);
    $stmt->bindParam(':competences', $_POST['competences']);
    $stmt->bindParam(':projets', $_POST['projets']);
    
    $stmt->execute();

    $db->close();    
?>