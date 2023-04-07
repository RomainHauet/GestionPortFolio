<div class="cadre">
    <form action="ajoutDB.php" method="POST">
        <div class="projet">
            <h3>Nom du projet :</h3>
            <textarea name="nom" rows="1" cols="60">{{projet.getNom()}}</textarea>
        </div>

        <div class="description_p">
            <h3>Description du projet :</h3>
            <textarea name="nom" rows="10" cols="60">{{projet.getDescription()}}</textarea>
        </div>

        <button>Enregistrer</button>
    </form>
</div>