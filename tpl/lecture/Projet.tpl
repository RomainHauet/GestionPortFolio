{% for projet in Projets %}

<div class="cadre">
    <h1>{{projet.getNom()}}</h1>
    <img src="" alt="projet">
    <p>{{projet.getDescription()}}</p>

    <table>
            <tr><button name="button">Projet li�</button></tr>
    </table>
</div>

{% endfor %}