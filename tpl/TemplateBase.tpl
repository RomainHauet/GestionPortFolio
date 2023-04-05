{% include "Entete.tpl" %}

{% block contenu %}

    {% if page == "" %} {% include "AccueilSite.tpl" %}

    {% elseif typeLecture == "lecture" %}

        {% include "Bandeau.tpl" %}
        {% if page == "Accueil" %} {% include "./lecture/Accueil.tpl" %}
        {% elseif page == "CV" %} {% include "./lecture/CV.tpl" %}
        {% elseif page == "Competences" %} {% include "./lecture/Competence.tpl" %}
        {% elseif page == "Projets" %} {% include "./lecture/Projet.tpl" %} 
        {% elseif page == "Credits" %} {% include "./lecture/Credit.tpl" %}
        {% elseif page == "Contacts" %} {% include "./lecture/Contact.tpl" %}
        {% endif %}

    {% elseif typelecture == "edition" %}

        {% include "Bandeau.tpl" %}
        {% if page == "Accueil" %} {% include "./edition/Accueil.tpl" %}
        {% elseif page == "CV" %} {% include "./edition/CV.tpl" %}
        {% elseif page == "Competences" %} {% include "./edition/Competence.tpl" %}
        {% elseif page == "Projets" %} {% include "./edition/Projet.tpl" %} 
        {% elseif page == "Credits" %} {% include "./edition/Credit.tpl" %}
        {% elseif page == "Contacts" %} {% include "./edition/Contact.tpl" %}
        {% endif %}

    {% endif %}

{% endblock %}

{% include "Pied.tpl" %}