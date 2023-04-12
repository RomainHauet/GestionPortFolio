{% for projet in Projets %}

<div class="cadre">
    <h1>{{projet.getNom()}}</h1>
    <img src="" alt="imageProjet">
    <p>{{projet.getDescription()}}</p>
</div>

{% endfor %}