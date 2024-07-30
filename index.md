---
---

<p class="mb-3">
  <em>CAe</em> = <em>Clavis Aethiopica</em><br>
  Chaîne = Marius Chaîne, “<a href="{{ '/works/chaine/' | relative_url }}">Répertoire des salam et malke'e</a>,” <i>ROC</i> 18 (1913): 183–203, 337–57.
</p>

<table class="table is-fullwidth">
    
  {% for work in site.works %}
  <tbody>

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
        <a class="button is-link is-size-4 px-4 py-1 mt-5">+</a>
      </td>

    </tr>

    <tr>
      
      <td class="is-linked" colspan="2">
        <ul>
          {% for line in work.stanzas[1] %}
          <li {% unless forloop.first %}class="is-hidden"{% endunless %} lang="gez">{{ line }}</li>
          {% endfor %}
        </ul>
      </td>

    </tr>

  </tbody>
  {% endfor %}

</table>

<script src="{{ '/assets/scripts/lunr/lunr.js' | relative_url }}"></script>