<div class="cadre">
    {{% for contact in Contacts %}}
        <form method="POST">
            <div class="mail">
            <h3>Insérez votre adresse mail</h3>
                <textarea name="mail" rows="1" cols="30">contact.getMail()</textarea>
            </div>

            <div class="numero">
                <h3>Insérez numéro de téléphone</h3>
                <textarea name="numero" rows="1" cols="30">contact.getNumerotel</textarea>
            </div>

            <div class="linkedin">
                <h3>Insérez votre adresse linkedIn</h3>
                <textarea name="linkedIn" rows="1" cols="30">contact.getLienLinkedin()</textarea>
            </div>

            <button name="buttonAjouter">Enregistrer</button>
        </form>
    {{% endfor %}}
</div>