<div class="cadre">
      <div class="cv">
        <div class="flex">
          <form action="ajoutDB.php" method="POST">
            <div class="nom">
              <h3>Nom :</h3>
              <textarea name="nom" rows="1" cols="60"></textarea>
            </div>
            <div class="prenom">
              <h3>Prénom :</h3>
              <textarea name="prenom" rows="1" cols="60"></textarea>
            </div>
            <div class="age">
              <h3>Âge :</h3>
              <textarea name="age" rows="1" cols="60"></textarea>
            </div>
            <div class="description">
              <h3>Votre description :</h3>
              <textarea name="description" rows="10" cols="60"></textarea>
            </div>
            <div class="formation">
              <h3>Liste de vos diplômes / formations :</h3>
              <textarea name="formation" rows="10" cols="60"></textarea>
            </div>
          </div>

          <div class="flex">
            <div class="photo">
              <img src="" alt="Ajouter une photo au CV">
              <input type="file" id="myfile" name="myfile" accept="image/png, image/jpeg, image/jpg, image/gif">
            </div>
            <div class="competences">
              <h3>Liste de vos compétences :</h3>
              <textarea name="competences" rows="10" cols="60"></textarea>
            </div>
            <div class="projets">
              <h3>Liste de vos projets :</h3>
              <textarea name="projets" rows="10" cols="60"></textarea>
            </div>
          </form>
        </div>
      </div>
    </div>