        <br/>
        <br/>
        <br/>
        <br/>
        {% for competence in Competences %}
            <h3>{{competence.getNom()}}</h3>
            <p>{{competence.getDescription()}}</p>
            {% for projet in Competences %}
                <button name="button">{{projet.getNom()}}</button>
            {% endfor %}
        {% endfor %}
        