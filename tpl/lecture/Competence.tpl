        {% for competence in Competence %}
            <h3>competence.nom</h3>
            <p>competence.description</p>
            {% for projet in Competence %}
                <button name="button">projet.nom</button>
        {% endfor %}