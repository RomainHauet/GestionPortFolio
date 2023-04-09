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
            if($tparam == null)
                $res = $stmt->execute();
            else
                $res = $stmt->execute($tparam);
            return $stmt->rowCount();
        }

        public function addUtilisateur($nom="", $prenom="", $password="", $description="", $etude="", $liens="")
        {
            $requete = 'insert into utilisateur values (?,?,?,?,?,?,?)';
            $this->execMaj($requete,array($nom,$prenom,$password,$description,$etude,$liens));
        }

        public function getUtilisateur($identifiant)
        {
            $requete = 'select * from utilisateur where id = ?';
            return $this->execQuery($requete,array($identifiant),'Utilisateur');
        }

        public function getProjets()
        {
            $requete = 'select * from projet';
            return $this->execQuery($requete,null,'Projet');
        }

        public function addProjet($nom, $description, $lienPhoto, $lienProjet)
        {
            $requete = 'insert into projet values (?,?,?,?,?)';
            $this->execMaj($requete,array($nom, $description, $lienPhoto, $lienProjet));
        }

        public function updateProjet($id, $nom, $description, $lienPhoto, $lienProjet)
        {
            $requete = 'update projet set nom = ?, description = ?, lienPhoto = ?, lienProjet = ? where id = ?';
            $this->execMaj($requete,array($nom, $description, $lienPhoto, $lienProjet, $id));
        }

        public function deleteProjet($id)
        {
            $requete = 'delete from projet where id = ?';
            $this->execMaj($requete,array($id));
        }

        public function getProjet($identifiant)
        {
            $requete = 'select * from projet where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'Projet');
        }

        public function addCompetence($identifiant, $nom, $description, $lienPhoto)
        {
            $requete = 'insert into competence values (?,?,?,?)';
            $this->execMaj($requete,array($identifiant, $nom, $description, $lienPhoto));
        }

        public function updateCompetence($id, $nom, $description, $lienPhoto)
        {
            $requete = 'update competence set nom = ?, description = ?, lienPhoto = ? where id = ?';
            $this->execMaj($requete,array($nom, $description, $lienPhoto, $id));
        }

        public function deleteCompetence($id)
        {
            $requete = 'delete from competence where id = ?';
            $this->execMaj($requete,array($id));
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

        public function addCV($identifiant, $nom, $prenom, $age, $description, $lienPhotoCV, $experience, $competence, $diplome) {
            // suprimer les anciens CV
            $this->execMaj('delete from cv where utilisateur = ?',array($identifiant));

            //rajoute le nouveau
            $requete = 'insert into cv values (?,?,?,?,?,?,?,?,?)';
            $this->execMaj($requete,array($identifiant, $nom, $prenom, $age, $description, $lienPhotoCV, $experience, $competence, $diplome));
        }

        public function addContact($identifiant, $numerotel, $lienLinkedin, $mail) {
            // suprimer les anciens contacts
            $this->execMaj('delete from contact where utilisateur = ?',array($identifiant));

            //rajoute le nouveau
            $requete = 'insert into contact values (?,?,?,?)';
            $this->execMaj($requete,array($identifiant, $numerotel, $lienLinkedin, $mail));
        }

        public function getContact($identifiant) {
            $requete = 'select * from contact where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'Contact');
        }

        public function addCredit($identifiant,$noms, $listeCopyright) {

            // suprimer les anciens credits
            $this->execMaj('delete from credit where utilisateur = ?',array($identifiant));

            //rajoute le nouveau
            $requete = 'insert into credit values (?,?,?)';
            $this->execMaj($requete,array($identifiant, $noms, $listeCopyright));
        }

        public function getCredit($identifiant) {
            $requete = 'select * from credit where utilisateur = ?';
            return $this->execQuery($requete,array($identifiant),'Credit');
        }

        public function verifierUtilisateur($identifiant, $motdepasse) {
            $requete = 'select * from utilisateur where id = ? and password = ?';
            if($this->execQuery($requete,array($identifiant, $motdepasse),'Utilisateur')) {return true;} else {return false;}
        }
    }

    class Utilisateur
    {
        private $id;
        private $nom;
        private $prenom;
        private $password;
        private $description;
        private $etude;
        private $liens;


        public function __construct($id ="", $nom="", $prenom="", $password="", $description="", $etude="", $liens="") {
            $this->id = $id;
            $this->nom = $nom;
            $this->prenom = $prenom;
            $this->password = $password;
            $this->description = $description;
            $this->etude = $etude;
            $this->liens = $liens;
        }

        public function getNom() { return $this->nom; }
        public function getPrenom() { return $this->prenom; }
        public function getPassword() { return $this->password; }
        public function getDescription() { return $this->description; }
        public function getEtude() { return $this->etude; }
        public function getLiens() { return $this->liens; }

    }

    class Projet
    {
        private $utilisateur;
        private $nom;
        private $image;
        private $description;

        public function __construct($utilisateur="", $nom="", $image="", $description="") {
            $this->utilisateur = $utilisateur;
            $this->nom = $nom;
            $this->image = $image;
            $this->description = $description;
        }

        public function getUtilisateur() { return $this->utilisateur; }
        public function getNom() { return $this->nom; }
        public function getImage() { return $this->image; }
        public function getDescription() { return $this->description; }
    }

    class Competence
    {
        private $utilisateur;
        private $nom;
        private $description;

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
        private $utilisateur;
        private $nom;
        private $prenom;
        private $age;
        private $description;
        private $formation;
        private $lienPhotoCV;
        private $competence;
        private $projet;

        public function __construct($utilisateur="", $nom="", $prenom="", $age="", $description="", $formation="", $lienPhotoCV="", $competence="", $projet="") {
            $this->utilisateur = $utilisateur;
            $this->nom = $nom;
            $this->prenom = $prenom;
            $this->age = $age;
            $this->description = $description;
            $this->formation = $formation;
            $this->lienPhotoCV = $lienPhotoCV;
            $this->competence = $competence;
            $this->projet = $projet;
        }

        public function getUtilisateur() { return $this->utilisateur; }
        public function getNom() { return $this->nom; }
        public function getPrenom() { return $this->prenom; }
        public function getAge() { return $this->age; }
        public function getDescription() { return $this->description; }
        public function getFormation() { return $this->formation; }
        public function getLienPhotoCV() { return $this->lienPhotoCV; }
        public function getCompetence() { return $this->competence; }
        public function getProjet() { return $this->projet; }
    }

    class Contact
    {
        private $utilisateur;
        private $numerotel;
        private $lienLinkedin;
        private $mail;

        public function __construct($utilisateur="", $numerotel="", $lienLinkedin="", $mail="") {
            $this->utilisateur = $utilisateur;
            $this->numerotel = $numerotel;
            $this->lienLinkedin = $lienLinkedin;
            $this->mail = $mail;
        }

        public function getUtilisateur() { return $this->utilisateur; }
        public function getNumerotel() { return $this->numerotel; }
        public function getLienLinkedin() { return $this->lienLinkedin; }
        public function getMail() { return $this->mail; }
    }

    class Credit
    {
        private $noms;
        private $listeCopyright;

        public function __construct($noms ="", $listeCopyright=""){
            $this->noms = $noms;
            $this->listeCopyright = $listeCopyright;
        }

        public function getNoms() {return $this->noms; }
        public function getListeCopyright() {return $this->listeCopyright; }
    }
?>