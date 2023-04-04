{% include "Entete.tpl" %}

{% block contenu %}

    {% if page == "" %} {% include "AcceuilSite.tpl" %} {% endif %}

    {% if typeLecture == "lecture" %} <!-- mode lecture -->

        {% if page == "acceuil" %} {% include "./lecture/Acceuil.tpl" %}
        {% elseif page == "cv" %}
        {% elseif page == "competence" %}
        {% elseif page == "projet" %}
        {% elseif page == "credits" %}
        {% elseif page == "contact" %}
        {% endif %}

    {% elseif typelecture == "edition" %} <!-- mode edition -->

        {% if page == "acceuil" %}
        {% elseif page == "cv" %}
        {% elseif page == "competence" %}
        {% elseif page == "projet" %}
        {% elseif page == "credits" %}
        {% elseif page == "contact" %}
        {% endif %}

    {% else %} <!-- erreur -->

        {% include "Erreur.tpl" %}

    {% endif %}

{% endblock %}

{% include "Pied.tpl" %}