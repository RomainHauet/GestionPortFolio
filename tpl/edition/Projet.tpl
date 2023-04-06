{% for projet in Projet %}
<h3>{{projet.getNom()}}</h3>
<p>{{projet.getDescription()}}</p>
{% for competence in Projet %}
<button name="button">Competence.nom</button>
{% endfor %}
{% endfor %}