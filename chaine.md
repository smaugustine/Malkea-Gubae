---
title: Chaîne, “Répertoire des salam et malke'e”
layout: default
permalink: /works/chaine/
---

<table class="table" id="chaine">

  {% for item in site.data.chaine %}
  {% assign work = site.works | find_exp: "work", "work.chaine contains item[0]" %}
  <tbody id="{{ item[0] | replace: 'b', 'bis' }}">

    <tr>
      
      <td rowspan="{% if work.chaine.size > 1 %}3{% else %}2{% endif %}">
        <strong>{{ item[0] | replace: 'b', ' bis' }}.</strong>
      </td>

      <td>
        <strong lang="gez">{{ item[1].incipit }}</strong>
      </td>

      <td>
        <a href="{{ work.url }}" lang="gez-latn">{{ work.titles[0].gez }}</a>
      </td>

    </tr>

    <tr>

      <td>
        {% if item[1].subjects.size > 0 %}

        {% for subject_id in item[1].subjects %}
        {% assign subject = site.data.subjects | find: "id", subject_id %}
        <a href="{{ subject.url }}">{{ subject.name.en }}</a>{% unless forloop.last %},{% endunless %}
        
        {% endfor %}

        {% else %}

        {% for subject in work.subjects %}
        <a href="{{ subject.url }}">{{ subject.name.en }}</a>{% unless forloop.last %},{% endunless %}
        {% endfor %}

        {% endif %}
      </td>

      <td>
        {% for subject in work.subjects %}
        <a href="{{ subject.url }}">{{ subject.name.en }}</a>{% unless forloop.last %},{% endunless %}
        {% endfor %}
      </td>

    </tr>

    <tr>
      
      {% if work.chaine.size > 1 %}
      <td colspan="2" class="is-size-7 pl-3">
        <span>Duplicate of:</span>
        {% for number in work.chaine %}
        {% unless number == item[0] %}
        <a href="#{{ number | replace: 'b', 'bis' }}">{{ number | replace: 'b', 'bis' }}</a>
        {% endunless %}
        {% endfor %}
      </td>
      {% endif %}

    </tr>

  </tbody>
  {% endfor %}

</table>