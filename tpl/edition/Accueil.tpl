<div class="cadre">
    <div class="pageAc">
        {{% for utilisateur in utilisateurs %}}
            <form action="ajoutDB.php" method="POST">
                <div class ="infos">
                    <div class="photo_2">
                        <img src="images/photo_CV.jpg" alt="photo à choisir dans la page CV">
                    </div>
                    <table class="accueil">
                        <tr>
                            <td>
                                <h3>Nom :</h3>
                                <textarea name="nom" rows="1" cols="60">{{utilisateur.getNom()}}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h3>Prénom :</h3>
                                <textarea name="prenom" rows="1" cols="60">{{utilisateur.getPrenom()}}</textarea>
                            </td>
                        </tr>
                    </table>
                    <table class="accueil">
                        <tr>
                            <td>
                                <h3>Niveau d'études :</h3>
                                <textarea name="niveau" rows="1" cols="60">{{utilisateur.getEtude()}}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <table class="propos">
                    <tr>
                        <td><hr></td>
                    </tr>
                    <tr>
                        <td>
                            <h3>A propos de moi</h3>
                            <textarea name="description" rows="10" cols="60">{{utilisateur.getDescription()}}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>Pour plus d'informations :</h3>
                            <textarea name="liens" rows="10" cols="60">{{utilisateur.getLiens()}}</textarea>
                        </td>    
                    </tr>
                </table>
                <input type="hidden" name="identifiant" value="{{identifiant}}">
                <input type="hidden" name="page" value="Accueil">
                <button>Enregistrer</button>
            </form>
        {{% endfor %}}
    </div>
</div>