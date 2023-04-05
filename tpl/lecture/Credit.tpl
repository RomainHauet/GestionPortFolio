        <h2>Les images suivantes ne nous appartiennent pas et ne peuvent pas être librement utilisée.</h2>
        {% for image in credit%}
            <p>{{image.nom}}</p>
        {% endfor %}

        <p> portfolio cree par : </p>
        <p> - {{identifiant}} </p>

        <p> Application crée par : </p>
        <ul>
            <li> Deniau Liam </li>
            <li> Tassery Hugo </li>
            <li> Hauet Romain </li>
            <li> Uhl Matthew </li>
            <li> Gouley Logann </li>
        </ul>
