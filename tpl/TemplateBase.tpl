{% include "Entete.tpl" %}

{% block contenu %}

    {% if page == "" %} {% include "Acceuilportfolio.tpl" %} {% endif %}

    {% if identifiant == "" %} <!-- mode lecture -->

        {% if page == "acceuil" %}
        {% elseif page == "cv" %}
        {% elseif page == "competence" %}
        {% elseif page == "projet" %}
        {% elseif page == "credits" %}
        {% elseif page == "contact" %}
        {% endif %}

    {% else %} <!-- mode edition -->

        {% if page == "acceuil" %}
        {% elseif page == "cv" %}
        {% elseif page == "competence" %}
        {% elseif page == "projet" %}
        {% elseif page == "credits" %}
        {% elseif page == "contact" %}
        {% endif %}

    {% endif %}
{% endblock %}

{% include "Pied.tpl" %}