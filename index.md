---
---
<table class="table is-fullwidth">
    
  {% for work in site.works %}
  <tbody>

    <tr>

      <td class="is-linked" rowspan="2">
        <a href="{{ work.url }}">
          <span><em>CAe</em>: {{ work.title }}</span>
          {% if work.chaine %}
          <br><small>Chaîne: {{ work.chaine | join: ", " }}</small>
          {% endif %}
        </a>
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

    </tr>

    <tr>
      
      <td class="is-linked" colspan="2">
        <a href="{{ work.url }}">
          <span lang="gez">{{ work.stanzas[1][0] }}</span>
        </a>
      </td>

    </tr>

  </tbody>
  {% endfor %}

</table>

<p>
  <em>CAe</em> = <em>Clavis Aethiopica</em><br>
  Chaîne = Marius Chaîne, “<a href="{{ '/works/chaine/' | relative_url }}">Répertoire des salam et malke'e</a>,” <i>ROC</i> 18 (1913): 183–203, 337–57.
</p>