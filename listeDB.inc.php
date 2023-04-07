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
            if($tparam == null) { $stmt->execute();}
            else { $stmt->execute($tparam); }

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

        public function getUtilisateur($identifiant)
        {
            $requete = 'select * from utilisateur where nom = ?';
            return $this->execQuery($requete,array($identifiant),'Utilisateur');
        }

        public function getProjets()
        {
            $requete = 'select * from projet';
            return $this->execQuery($requete,null,'Projet');
        }

        public function getProjet($identifiant)
        {
            $requete = 'select * from projet where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'Projet');
        }

        public function getCompetence($identifiant)
        {
            $requete = 'select * from competence where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'Competence');
        }

        public function getCV($identifiant) {
            $requete = 'select * from cv where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'CV');
        }

        public function getContact($identifiant) {
            $requete = 'select * from contact where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'Contact');
        }

        public function getCredit($identifiant) {
            $requete = 'select * from credit where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'Credit');
        }

        public function verifierUtilisateur($utilisateur, $motdepasse) {
            $requete = 'select * from utilisateur where nom = ? and password = ?';
            if($this->execQuery($requete,array($utilisateur, $motdepasse),'Utilisateur')) {return true;} else {return false;}
        }
    }

    class Utilisateur
    {
        private $nom;
        private $password;

        public function __construct($nom ="", $password ="") {
            $this->nom = $nom;
            $this->password = $password;
        }

        public function addUtilisateur($nom, $password) {
            $requete = 'insert into utilisateur values (?, ?)';
            $this->execMaj($requete,array($nom, $password));
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

    class Competence
    {
        private $utilisateur;
        private $nom;
        private $description;
        private $niveau;

        public function __construct($utilisateur="", $nom="", $description="") {
            $this->utilisateur = $utilisateur;
            $this->nom = $nom;
            $this->description = $description;
        }

        public function getUtilisateur() { return $this->utilisateur; }
        public function getNom() { return $this->nom; }
        public function getDescription() { return $this->description; }
    }

    class CV
    {
        private $nom;
        private $prenom;
        private $age;
        private $description;
        private $etudes;
        private $photoCV;
        private $competence;
        private $projets;

        public function __construct($nom="", $prenom="", $age="", $description="", $etudes="", $photoCV="", $competence="", $projets="") {
            $this->nom = $nom;
            $this->prenom = $prenom;
            $this->age = $age;
            $this->description = $description;
            $this->etudes = $etudes;
            $this->photoCV = $photoCV;
            $this->competence = $competence;
            $this->projets = $projets;
        }

        public function addCV($nom, $prenom, $age, $description, $etudes, $photoCV, $competence, $projets) {
            $requete = 'insert into cv values (?, ?, ?, ?, ?, ?, ?, ?)';
            $this->execMaj($requete,array($nom, $prenom, $age, $description, $etudes, $photoCV, $competence, $projets));
        }

        public function getNom() { return $this->nom; }
        public function getPrenom() { return $this->prenom; }
        public function getAge() { return $this->age; }
        public function getDescription() { return $this->description; }
        public function getEtudes() { return $this->etudes; }
        public function getPhotoCV() { return $this->photoCV; }
        public function getCompetence() { return $this->competence; }   
        public function getProjets() { return $this->projets; } 
    }

    class Contact
    {
        private $utilisateur;
        private $telephone;
        private $linkedin;
        private $email;

        public function __construct($utilisateur="", $telephone="", $linkedin="", $email="") {
            $this->utilisateur = $utilisateur;
            $this->telephone = $telephone;
            $this->linkedin = $linkedin;
            $this->email = $email;
        }

        public function getUtilisateur() { return $this->utilisateur; }
        public function getTelephone() { return $this->telephone; }
        public function getLinkedin() { return $this->linkedin; }
        public function getEmail() { return $this->email; }
    }
    
?>