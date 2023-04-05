{% include "Entete.tpl" %}

{% block contenu %}

    {% if page == "" %} {% include "AccueilSite.tpl" %}

    {% elseif typeLecture == "lecture" %} <!-- mode lecture -->

        {% include "Bandeau.tpl" %}
        {% if page == "accueil" %} {% include "./lecture/Accueil.tpl" %}
        {% elseif page == "cv" %} {% include "./lecture/CV.tpl" %}
        {% elseif page == "competence" %} {% include "./lecture/Competence.tpl" %}
        {% elseif page == "projet" %} {% include "./lecture/Projet.tpl" %} 
        {% elseif page == "credits" %} {% include "./lecture/Credit.tpl" %}
        {% elseif page == "contact" %} {% include "./lecture/Contact.tpl" %}
        {% endif %}

    {% elseif typelecture == "edition" %} <!-- mode edition -->

        {% include "Bandeau.tpl" %}
        {% if page == "accueil" %} {% include "./edition/Accueil.tpl" %}
        {% elseif page == "cv" %} {% include "./edition/CV.tpl" %}
        {% elseif page == "competence" %} {% include "./edition/Competence.tpl" %}
        {% elseif page == "projet" %} {% include "./edition/Projet.tpl" %} 
        {% elseif page == "credits" %} {% include "./edition/Credit.tpl" %}
        {% elseif page == "contact" %} {% include "./edition/Contact.tpl" %}
        {% endif %}

    {% endif %}

{% endblock %}

{% include "Pied.tpl" %}