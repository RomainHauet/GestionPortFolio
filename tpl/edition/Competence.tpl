<div class="cadre">
    <form action="ajoutDB.php" method="POST">
        <div class="competence">
            <h3>Insérer nom competence</h3>
            <textarea name="nom"></textarea>
        </div>
        
        <div class="description_c">
            <h3>Insérer description competence</h3>
            <textarea name="description"></textarea>
        </div>

        <input type="hidden" name="identifiant" value="{{identifiant}}">
        <input type="hidden" name="page" value="Competences">
        <input type="hidden" name="action" value="ajouter">
        <button>Enregistrer</button>
    </form>

    {% for competence in Competences %}
        <form action="ajoutDB.php" method="POST">
            <div class="competence">
                <h3>Nom de la compétence :</h3>
                <textarea name="nom" rows="1" cols="60">{{competence.getNom()}}</textarea>
            </div>

            <div class="description_c">
                <h3>description :</h3>
                <textarea name="description" rows="10" cols="60">{{competence.getDescription()}}</textarea>
            </div>

            <input type="hidden" name="identifiant" value="{{identifiant}}">
            <input type="hidden" name="page" value="Competences">
            <input type="hidden" name="id" value="{{competence.getId()}}">gvtbyhujn,ikujnh
            <input type="hidden" name="action" value="modifier">
            
            <button>Enregistrer</button>
        </form>

        <form action="ajoutDB.php" method="POST">
            <input type="hidden" name="identifiant" value="{{identifiant}}">
            <input type="hidden" name="page" value="Competences">
            <input type="hidden" name="action" value="supprimer">
            <input type="hidden" name="id" value="{{competence.getId()}}">
            <button>Supprimer</button>
        </form>
    {% endfor %}
</div>