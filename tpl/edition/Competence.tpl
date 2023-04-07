<div class="cadre">
    <form action="ajoutDB.php" method="POST">
        <div class="competence">
            <h3>Nom de la compétence :</h3>
            <textarea name="nom" rows="1" cols="60">{{competence.getNom()}}</textarea>
        </div>

        <div class="description_c">
            <h3>description :</h3>
            <textarea name="nom" rows="10" cols="60">{{competence.getDescription()}}</textarea>
        </div>

        <div class="langages">
            <h3>langages concernés :</h3>
            <textarea name="nom" rows="10" cols="60"></textarea>
        </div>

        <button>Enregistrer</button>
    </form>
</div>