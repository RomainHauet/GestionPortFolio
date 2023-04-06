        {% for competence in Competence %}
            <h3>{{competence.getNom()}}</h3>
            <p>{{competence.getDescription()}}</p>
            {% for projet in Competence %}
                <button name="button">projet.nom</button>
            {% endfor %}
        {% endfor %}