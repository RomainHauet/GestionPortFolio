{% include "Entete.tpl" %}

{% block contenu %}

    {% if page == "" %} {% include "AccueilSite.tpl" %} {% endif %}

    {% if typeLecture == "lecture" %} <!-- mode lecture -->

        {% include "Bandeau.tpl" %}
        {% if page == "accueil" %} {% include "./lecture/Acceuil.tpl" %}
        {% elseif page == "cv" %}
        {% elseif page == "competence" %}
        {% elseif page == "projet" %}
        {% elseif page == "credits" %}
        {% elseif page == "contact" %}
        {% endif %}

    {% elseif typelecture == "edition" %} <!-- mode edition -->

        {% if page == "accueil" %}
        {% elseif page == "cv" %}
        {% elseif page == "competence" %}
        {% elseif page == "projet" %}
        {% elseif page == "credits" %}
        {% elseif page == "contact" %}
        {% endif %}

    {% endif %}

{% endblock %}

{% include "Pied.tpl" %}