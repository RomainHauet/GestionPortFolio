        <div id="connection">
            <h1>Connexion</h1>
            <form action="GestionRedirection.php" method="POST">
                <table>
                    <tr>
                        <td>Nom</td>
                        <td><input name="nom" required ></td>
                    </tr>
                    <tr>
                        <td>Mot de passe</td>
                        <td><input type="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td><input type="reset" value="Annuler"></td>
                        <td><input type="submit" value="Valider"></td>
                    </tr>
                </table>
            </form>
        </div>
        
    {% for projet in projets %}
        <h3>{{projet.getUtilisateur()}}</h3>
        <h3>{{projet.getNom()}}</h3>
        <p>{{projet.getDescription()}}</p>
        <form action="GestionRedirection.php" method="POST">
            <input type="hidden" name="identifiant" value="{{projet.getUtilisateur()}}">
            <input type="hidden" name="page" value="accueil">
            <input type="submit" value="Voir PortFolio">
        </form>
    {% endfor %}