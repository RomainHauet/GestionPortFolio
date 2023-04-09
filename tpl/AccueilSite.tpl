<header class="accueil">
    <h3 class="credits">Bienvenue sur le créateur de PortFolio !</h3>-
</header>

<div class="cadre">
    <div class="cv">
        <div class="flex">
            {% for projet in Projets %}
                <div class="description">
                    <h3>{{projet.getUtilisateur()}}</h3>
                    <h3>{{projet.getNom()}}</h3>
                    <p>{{projet.getDescription()}}</p>
                    <form action="GestionRedirection.php" method="POST">
                        <input type="hidden" name="identifiant" value="{{projet.getUtilisateur()}}">
                        <input type="hidden" name="page" value="Accueil">
                        <input type="submit" value="Voir PortFolio">
                    </form>
                </div>
            {% endfor %}
        </div>

        <div class="flex">
            <div class="connection">
                <form action="GestionRedirection.php" method="POST">
                    <h1>Connexion</h1>
                    <table>
                        <tr>
                            <td>Nom</td>
                            <td><input name="identifiant" required ></td>
                        </tr>
                        <tr>
                            <td>Mot de passe</td>
                            <td><input type="password" name="motdepasse" required></td>
                            <td id=red>{{erreur}}</td>                        
                        </tr>
                        <tr>
                            <td><input type="hidden" name="page" value="Accueil"></td>
                            <td><input type="reset" value="Annuler"></td>
                            <td><input type="submit" value="Valider"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="connection">
                <form action="GestionRedirection.php" method="POST">
                    <h1>Inscription</h1>
                    <table>
                        <tr>
                            <td>Nom</td>
                            <td><input name="identifiant" required ></td>
                        </tr>
                        <tr>
                            <td>Mot de passe</td>
                            <td><input type="password" name="motdepasse" required></td>
                            <td id=red>{{erreur}}</td>                        
                        </tr>
                        <tr>
                            <td><input type="hidden" name="page" value="Accueil"></td>
                            <td><input type="reset" value="Annuler"></td>
                            <td><input type="submit" value="Valider"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    <div>
</div>