        {% for competence in competence %}
            <h3>competence.nom</h3>
            <p>competence.description</p>
            {% for projet in competence %}
                <button name="button">projet.nom</button>
        {% endfor %}