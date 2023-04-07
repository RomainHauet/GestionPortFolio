<div class="cadre">
            <br />
            <br />
            <br />
            <br />
            <h1> Mes projets </h1>
            {% for projet in Projet %}
            <h3>{{projet.getNom()}}</h3>
            <p>{{projet.getDescription()}}</p>
            {% for competence in Projet %}
            <button name="button">competence.nom</button>
            {% endfor %}
    {% endfor %}
</div>