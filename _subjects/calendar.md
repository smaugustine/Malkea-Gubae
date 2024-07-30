---
title: Calendar
layout: default
months: [Maskaram, Ṭəqəmt, Ḫədār, Tāḫśāś, Ṭərr, Yakkātit, Maggābit, Miyāzyā, Gənbot, Sane, Ḥamle, Naḥase, Ṗāgʷəmen]
types: [Trinitarian, Marian, Angelic, Prophets/Apostles, Martyrs, Righteous, Other]
---

<div id="calendar" class="content">

  <p>Legend:</p>
  <ul style="columns: 2;">
    {% for type in page.types %}
    <li data-category="{{ type }}">{{ type }}</li>
    {% endfor %}
  </ul>

  {% for month_name in page.months %}
  {% assign month = forloop.index %}

    <h2 class="title is-5">{{ month_name }}</h2>

    <ol>

      {% for day in (1..30) %}
      {% if month == 13 and day == 7 %}{% break %}{% endif %}

      {% assign date = day | append: '/' | append: month %}
      {% assign commemorations = site.data.subjects | where_exp: "subject", "subject.commemorations contains date" %}
      
      {% unless commemorations.size == 0 %}
      <li value="{{ day }}">
        <ul>
          {% for subject in commemorations %}
          <li data-category="{{ subject.category }}">
            <a href="{{ subject.url }}">
              <strong lang="gez">{{ subject.name.gez | fidal }} </strong>
              <small lang="gez-latn" style="white-space: nowrap;">({{ subject.name.gez }})</small><br>
              <span lang="en">{{ subject.name.en }}</span>
            </a>
          </li>
          {% endfor %}
        </ul>
      </li>
      {% endunless %}

      {% endfor %}

    </ol>

  {% endfor %}

</div>