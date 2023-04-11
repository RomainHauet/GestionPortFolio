<div class="cadre">
    <form action="ajoutDB.php" method="POST">
        <div class="projet">
            <h3>Insérer nom projet</h3>
            <textarea name="nom"></textarea>
        </div>
        
        <div class="description_p">
            <h3>Insérer description projet</h3>
            <textarea name="description"></textarea>
        </div>

        <div class="projet">
            <h3> Insérer image projet</h3>
            <input type="file" name="image" id="image" accept="image/png, image/jpeg">
        </div>
        
        <input type="hidden" name="identifiant" value="{{identifiant}}">
        <input type="hidden" name="page" value="Projets">
        <input type="hidden" name="action" value="ajouter">
        <button>Enregistrer</button>
    </form>

    {% for projet in Projets %}
        <form action="ajoutDB.php" method="POST">
            <div class="projet">
                <h3>Nom du projet :</h3>
                <textarea name="nom" rows="1" cols="60">{{projet.getNom()}}</textarea>
            </div>
            <div class="description_p">
                <h3>Description du projet :</h3>
                <textarea name="description" rows="10" cols="60">{{projet.getDescription()}}</textarea>
            </div>

            <div class="projet">
            <h3> Insérer image projet</h3>
            <input type="file" name="image" id="image" accept="image/png, image/jpeg">
        </div>

            <input type="hidden" name="identifiant" value="{{identifiant}}">
            <input type="hidden" name="id" value="{{projet.getId()}}">
            <input type="hidden" name="page" value="Projets">
            <input type="hidden" name="action" value="modifier">
            <button>Enregistrer</button>
        </form>
        <form action="ajoutDB.php" method="POST">
            <input type="hidden" name="identifiant" value="{{identifiant}}">
            <input type="hidden" name="id" value="{{projet.getId()}}">
            <input type="hidden" name="page" value="Projets">
            <input type="hidden" name="action" value="supprimer">
            <button>Supprimer</button>
        </form>
    {% endfor %}
</div>