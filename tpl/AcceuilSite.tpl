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
        
    {% for projet in db.getProjet() %}
        <h3>{$projet.utilisateur.nom}</h3>
        <h3>{$projet.nom}</h3>
        <p>{$projet.description}</p>
    {% endfor %}