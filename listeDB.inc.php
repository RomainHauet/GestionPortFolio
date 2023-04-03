<?php

    class DB
    {
        private static $instance = null;
        private $connect = null;

        private function __construct()
        {
            $connStr = 'pgsql:host=woody port=5432 dbname=hr202541';
        
            try {
                $this->db = new PDO($connStr, 'hr202541', 'aled');
                $this->connect->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER); 
                $this->connect->setAttribute(PDO::ATTR_ERRMODE , PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                echo "probleme de connexion :".$e->getMessage();
                return null;
            }
        }

        public static function getInstance()
        {
            if (is_null(self::$instance))
            {
                try {  self::$instance = new DB(); } 
                catch (PDOException $e) { echo $e; }
            }

            $obj = self::$instance;

            if (($obj->connect) == null) { self::$instance=null; }
            return self::$instance;
        }

        public function close() { $this->connect = null; }

        private function execQuery($requete,$tparam,$nomClasse) {
            
            //on prépare la requête
            $stmt = $this->connect->prepare($requete);

            $stmt->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, $nomClasse); 
        
            //on exécute la requête
            if ($tparam != null) { $stmt->execute($tparam); }
	        else { $stmt->execute(); }

            // on récupère les résultats
            $tab = array();
	        $tuple = $stmt->fetch();

            $tab = array();
            $tuple = $stmt->fetch();
            
            if($tulple)
            {
                while ($tuple != null) {
                    $tab[] = $tuple;
                    $tuple = $stmt->fetch();
                }
            }

            return $tab;
        }

        private function execMaj($ordreSQL,$tparam)
        {
            $stmt = $this->connect->prepare($ordreSQL);
            $res = $stmt->execute($tparam); //execution de l'ordre SQL      	     
            return $stmt->rowCount();
        }

        public function getProjets()
        {
            $requete = 'select * from Projet';
            return $this->execQuery($requete,null,'Projet');
        }

    }
    class Utilisateur
    {
        private $nom;
        private $password;

        public function __construct($nom, $password) {
            $this->nom = $nom;
            $this->password = $password;
        }
    }

    class Projet
    {
        private $utilisateur;
        private $nom;
        private $image;
        private $description;
        private $competence;

        public function __construct($utilisateur, $nom, $image, $description, $competence) {
            $this->utilisateur = $utilisateur;
            $this->nom = $nom;
            $this->image = $image;
            $this->description = $description;
            $this->competence = $competence;
        }

        public function getUtilisateur() { return $this->utilisateur; }
        public function getNom() { return $this->nom; }

    }
?>