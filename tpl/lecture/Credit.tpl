<div class="cadre">
    <h1 class="credits">Les images suivantes ne nous appartiennent pas et ne peuvent pas être librement utilisée.</h1>
    {% for image in credit%}
        <p>{{image.nom}}</p>
    {% endfor %}

    <h3 class="credits">PortFolio créé par :</h3>
    <h5 class="credits">{{identifiant}}</h5>

    <h3 class="credits">Application créée par :</h3>
    <ul>
        <li>Deniau Liam</li>
        <li>Gouley Logann</li>
        <li>Hauet Romain</li>
        <li>Tassery Hugo</li>
        <li>Uhl Matthew </li>
    </ul>
</div>
