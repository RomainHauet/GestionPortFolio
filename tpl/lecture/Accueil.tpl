{% for utilisateur in Utilisateurs %}

<div class="cadre">
    <div class="pageAc">
        <div class ="infos">
            <div class="photo_2">
                <img src="images/photo_CV.jpg">
            </div>
            <table class="accueil">
                <tr>
                    <td><h3>{{utilisateur.getNom()}}</h3></td>
                </tr>
                <tr>
                    <td><h3>{{utilisateur.getPrenom()}}</h3></td>
                </tr>
            </table>
            <table class="accueil">
                <tr>
                    <td><h3>{{utilisateur.getEtude()}}</h3></td>
                </tr>
            </table>
        </div>

        <table class="propos">
            <tr>
                <td><hr></td>
            </tr>
            <tr>
                <td><h3>À propos de moi</h3></td>
            </tr>
            <tr>
                <td>{{utilisateur.getDescription()}}</td>
            </tr>
            <tr>
                <td><h3>Pour plus d'informations :</h3></td>
            </tr>
            <tr>
                <td><a href="{{utilisateur.getLiens()}}">Linkedin</a></td>
            </tr> 
        </table>
    </div>
</div>

{% endfor %}