---
title: Ṣəḥufāna Malkəʾ
layout: blog/default
permalink: /blog
---

<section class="section">
  <div class="container" style="background: inherit;">
    <div class="columns is-centered">
      <div class="column">
    
        {% for post in site.posts %}
        <article class="card">
          <div class="card-content">
            <a href="{{ post.url }}">
              <h1 class="title is-5">
                <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | to_ethiopic }}</time>
                <time datetime="{{ post.date | date_to_xmlschema }}">({{ post.date | date: "%-d %B %Y" }})</time>
              </h1>
            </a>
            <a href="{{ post.url }}"><h2 class="subtitle is-2">{{ post.title }}</h2></a>
            {{ post.excerpt }} <span class="tag"><a href="{{ post.url }}">Continue reading</a></span>
          </div>
        </article>
        {% endfor %}
    
      </div>
    </div>
  </div>
</section>