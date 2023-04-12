<div class="cadre">
    {% for competence in Competences %}
        <h3>{{competence.getNom()}}</h3>
        <p>{{competence.getDescription()}}</p>
    {% endfor %}
</div>