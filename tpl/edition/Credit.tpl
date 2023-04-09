<div class="cadre">
    {% for Credit in Credits %}
        <form method="POST">
            <div class="noms">
                <h3>Insérez votre nom pour les crédits :</h3>
                <textarea name="nom" rows="1" cols="60">{{Credit.getNoms()}}</textarea>
            </div>
            <div class="lien">
                <h3>Insérez chaque lien d'images non-libre :</h3>
                <textarea name="listeCopyright" rows="10" cols="60">{{Credit.getListeCopyright()}}</textarea>
            </div>
            <input type="hidden" name="identifiant" value="{{identifiant}}"/>
            <input type="hidden" name="page" value="Credits"/>
            <button name="buttonAjouter">Enregistrer</button>
        </form>
    {% endfor %}
</div>