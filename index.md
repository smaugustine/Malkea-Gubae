---
---

<p class="mb-3">
  <em>CAe</em> = <em>Clavis Aethiopica</em><br>
  Chaîne = Marius Chaîne, “<a href="{{ '/works/chaine/' | relative_url }}">Répertoire des salam et malke'e</a>,” <i>ROC</i> 18 (1913): 183–203, 337–57.
</p>

<table class="table is-fullwidth">
    
  {% for work in site.works %}
  <tbody id="{{ work.title }}">

    <tr>

      <td class="is-linked" rowspan="2">
        <span><em>CAe</em>: {{ work.title }}</span>
        {% if work.chaine %}
        <br><small>Chaîne: {{ work.chaine | join: ", " }}</small>
        {% endif %}
      </td>

      <td class="is-linked">
        <a href="{{ work.url }}">
          <strong lang="gez">{{ work.titles[0].gez | fidal }}</strong>
          <br><small lang="gez-latn">{{ work.titles[0].gez }}</small>
        </a>
      </td>

      <td class="is-linked">
        <a href="{{ work.url }}">
          <strong>{{ work.titles[0].en }}</strong>
        </a>
      </td>

      <td rowspan="2" style="text-align: center;">
        <a class="button expands is-link is-size-4 px-4 py-1 mt-5" data-target="">+</a>
      </td>

    </tr>

    <tr>
      
      <td class="is-linked is-hidden-desktop" colspan="2">
        <span class="collapsible">{{ work.stanzas[1][0] }}</span>
        <ol class="stanzas collapsible is-hidden">
          <li>
            <ul>
              <li>{{ work.stanzas[1][0] }}</li>
              <li>{{ work.stanzas[1][1] }}</li>
              <li class="ellipsis"></li>
            </ul>
          </li>
          {% if work.stanzas[2] %}
          <li>
            <ul>
              <li>{{ work.stanzas[2][0] }}</li>
              <li>{{ work.stanzas[2][1] }}</li>
              <li class="ellipsis"></li>
            </ul>
          </li>
          {% endif %}
        </ol>
      </td>

      <td class="is-linked is-hidden-touch" colspan="1">
        <span class="collapsible">{{ work.stanzas[1][0] }}</span>
        <ol class="stanzas collapsible is-hidden">
          <li>
            <ul>
              <li>{{ work.stanzas[1][0] }}</li>
              <li>{{ work.stanzas[1][1] }}</li>
              <li class="ellipsis"></li>
            </ul>
          </li>
          {% if work.stanzas[2] %}
          <li>
            <ul>
              <li>{{ work.stanzas[2][0] }}</li>
              <li>{{ work.stanzas[2][1] }}</li>
              <li class="ellipsis"></li>
            </ul>
          </li>
          {% endif %}
        </ol>
      </td>

      <td class="is-linked is-hidden-touch" colspan="1">
        {% if work.subjects.size > 0 %}
        <span class="collapsible">
          {% for subject in work.subjects %}
          <a href="{{ subject.url }}">{{ subject.name.en }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </span>
        <span class="collapsible is-hidden">
          <ul style="list-style-position: outside; margin-inline-start: 2em;">
            {% for subject in work.subjects %}
            <li style="list-style: disc; margin-bottom: 0.75rem;">
              <span class="tag is-dark is-pulled-right">{{ subject.category }}</span>
              <a href="{{ subject.url }}">
                <strong lang="gez">{{ subject.name.gez | fidal }}</strong>
                {% if subject.name.gez.size > 10 %}<br>{% endif %}
                <small lang="gez-latn">{{ subject.name.gez }}</small>
                <br><span lang="en">{{ subject.name.en }}</span>
              </a>
            </li>
            {% endfor %}
          </ul>
        </span>
        {% endif %}
      </td>

    </tr>

  </tbody>
  {% endfor %}

</table>

<script>
$(document).ready(function() {

  $('.button.expands').on('click', function() {

      $(this).parents('tbody').find('.collapsible').toggleClass('is-hidden');

  });

});
</script>

<script src="{{ '/assets/scripts/lunr/lunr.js' | relative_url }}"></script>