{% for competence in Competences %}
    <div class="cadre">
            <h3>{{competence.getNom()}}</h3>
            <p>{{competence.getDescription()}}</p>
    </div>
{% endfor %}