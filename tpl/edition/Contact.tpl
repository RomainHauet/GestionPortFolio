<div class="cadre">
    {% for contact in Contacts %}
        <form action="ajoutDB.php" method="POST">
            <div class="mail">
            <h3>Insérez votre adresse mail</h3>
                <textarea name="mail" rows="1" cols="30">{{contact.getMail()}}</textarea>
            </div>

            <div class="numero">
                <h3>Insérez numéro de téléphone</h3>
                <textarea name="numerotel" rows="1" cols="30">{{contact.getNumerotel()}}</textarea>
            </div>

            <div class="linkedin">
                <h3>Insérez votre adresse linkedIn</h3>
                <textarea name="lienLinkedin" rows="1" cols="30">{{contact.getLienLinkedin()}}</textarea>
            </div>
            <input type="hidden" name="identifiant" value="{{identifiant}}"/>
            <input type="hidden" name="page" value="Contacts"/>
            <button name="buttonAjouter">Enregistrer</button>
        </form>
    {% endfor %}
</div>