<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

    class DB
    {
        private static $instance = null;
        private $connect = null;

        private function __construct()
        {
            $connStr = 'pgsql:host=woody port=5432 dbname=hr202541';
        
            try {
                $this->connect = new PDO($connStr, 'hr202541', 'aled');
                $this->connect->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER); 
                $this->connect->setAttribute(PDO::ATTR_ERRMODE , PDO::ERRMODE_EXCEPTION); 
            } catch (PDOException $e) {
                echo "Erreur de connexion : " . $e->getMessage();
            }
        }

        public static function getInstance()
        {
            if (is_null(self::$instance))
            {
                  try
                { 
                  self::$instance = new DB();
                } 
                catch (PDOException $e)
                {
                    echo $e;
                }
            } //fin IF
             
            $obj = self::$instance;
    
            if (($obj->connect) == null)
            {
               self::$instance=null;
            }
            return self::$instance;
        }

        public function close() { $this->connect = null; }

        private function execQuery($requete,$tparam,$nomClasse)
        {
            //on prépare la requête
            $stmt = $this->connect->prepare($requete);
            
            //on indique que l'on va récupére les tuples sous forme d'objets instance de Client
            $stmt->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, $nomClasse); 
            
            //on exécute la requête
            $stmt->execute();

            //récupération du résultat de la requête sous forme d'un tableau d'objets
            $tab = array();
            
            $tuple = $stmt->fetch(); //on récupère le premier tuple sous forme d'objet
            if ($tuple)
            {
                //au moins un tuple a été renvoyé
                while ($tuple != false)
                {
                    $tab[]=$tuple; //on ajoute l'objet en fin de tableau
                    $tuple = $stmt->fetch(); //on récupère un tuple sous la forme d'un objet instance de la classe $nomClasse	       
                } //fin du while	           	     
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
            $requete = 'select * from projet';
            return $this->execQuery($requete,null,'Projet');
        }

        public function getUtilisateurs()
        {
            $requete = 'select * from utilisateur';
            return $this->execQuery($requete,null,'Utilisateur');
        }

        public function getCompetences()
        {
            $requete = 'select * from competence';
            return $this->execQuery($requete,null,'Competence');
        }

        public function getUtilisateur($identifiant, $motDePasse)
        {
            $requete = 'select * from competence where id = '+$identifiant+' and password = '+$motDePasse;
            return $requete;
        }

        public function getAccueil()
        {
            return '';
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

        public function __construct($utilisateur="", $nom="", $image="", $description="", $competence="") {
            $this->utilisateur = $utilisateur;
            $this->nom = $nom;
            $this->image = $image;
            $this->description = $description;
            $this->competence = $competence;
        }

        public function getUtilisateur() { return $this->utilisateur; }
        public function getNom() { return $this->nom; }
        public function getImage() { return $this->image; }
        public function getDescription() { return $this->description; }
        public function getCompetence() { return $this->competence; }
    }
?>