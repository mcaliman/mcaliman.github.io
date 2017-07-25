---
layout: page
title: Data Science
excerpt: "An archive of Data Science posts sorted by date."
search_omit: true
---



<ul class="post-list">
    {% for post in site.categories.datascience %}
    <li>
        <article>
            <a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date">
                    <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%d/%m/%Y" }}</time>
                </span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a>
        </article>
    </li>
    {% endfor %}
</ul>
