---
layout: page
title: Articles
excerpt: "An archive of articles sorted by date."
search_omit: true
---

<h2>Nota: sto trasferendo i post sul Java nel nuovo blog dedicato [**javamaniax.com**](http://javamaniax.com)</h2>

<ul class="post-list">
{% for post in site.categories.articles %} 
  <li>
	<article>
             <a href="{{ site.url }}{{ post.url }}">
      {{ post.title }} 
	<span class="entry-date">
		<time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time>
	</span>{% if false && post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a>
        </article>
  </li>
{% endfor %}
</ul>
