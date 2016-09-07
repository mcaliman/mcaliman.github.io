---
layout: page
title: Blog
excerpt: "An archive of blog posts sorted by date."
search_omit: true
---

<p>Nota: sto trasferendo i post su Java nel nuovo blog dedicato <a href="http://javamaniax.com">javamaniax.com</a></p>

<ul class="post-list">
    {% for post in site.categories.blog %}
    <li>
        <article>
            <a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date">
                    <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time>
                </span>{% if false && post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a>
        </article>
    </li>
    {% endfor %}
</ul>
