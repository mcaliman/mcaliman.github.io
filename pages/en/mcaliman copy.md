---
layout: page
lang: en
permalink: /mcaliman/
title: About
date: 2024-07-15
modified: 2023-07-24
published: true
tags: [en]
---


Hello, I'm Massimo Caliman. 
I'm a software architect & developer with a consolidated experience on Java.
I'm working as IT specialist since 1995 and since 1998  almost exclusively of Enterprise Java applications. 
I'm Java Italian Association member since 1999 and co-founder of Java User Group Genova.
I also have experience in Python and R and others many languages such as C,C++,C#.

My interests include coding, Computer Science (especially algorithms and software design) and Data Science.  
I made my passion my work.

## How to contact me? 
Here are a few places to touch base:
* [LinkedIn](https://www.linkedin.com/in/mcaliman)
* [Twitter](http://twitter.com/mcaliman)
* [GitHub](https://github.com/mcaliman)

You can reach me by email at [mcaliman@gmail.com](mailto:mcaliman@gmail.com)


# Skills
{% for item in site.data.linkedin.Skills %}
* {{ item.name }}
{% endfor %}

# Professional assets
* Pragmatic problem solving skills 
* Strong ambition for meeting deadlines 
* Proactive thinking 
* Highly self motivated
* Lateral Thinking 
* Ability to adapt to changing trends, technology and general working environments
* Excellent communication / Interpersonal / Social skills 
* Strong will to learn and adapt 
* Persistent 
* Able to work and make decisions under pressure

# Languages
{% for item in site.data.linkedin.Languages %}
* **{{ item.name }}**: {{ item.proficiency }}
{% endfor %}

# Education
{% for item in site.data.linkedin.Education %}
* **{{ item.school_name }}**
  {{ item.degree_name }} ({{ item.start_date }}{% if item.end_date != "" %} – {{ item.end_date }}{% endif %})
{% endfor %}

# Experience
{% for item in site.data.linkedin.Positions %}
* **{{ item.company_name }}** ({% if item.location != "" %}{{ item.location }}{% endif %})
  *{{ item.title }}* | {{ item.started_on }} - {% if item.finished_on == "" %}present{% else %}{{ item.finished_on }}{% endif %}

  {{ item.description }}
{% endfor %}

# Courses
{% for item in site.data.linkedin.Courses %}
* {{ item.name }}
{% endfor %}

# Certifications
{% for item in site.data.linkedin.Certifications %}
* **{{ item.name }}**, {{ item.authority }} ({{ item.started_on }})
  {% if item.license_number != "" %}License: {{ item.license_number }}{% endif %}
  {% if item.url != "" %}[Credential Link]({{ item.url }}){% endif %}
{% endfor %}

# Projects
{% for item in site.data.linkedin.Projects %}
* **{{ item.title }}** ({{ item.started_on }}{% if item.finished_on != "" and item.finished_on != item.started_on %} - {{ item.finished_on }}{% endif %})
  {% if item.url != "" %}[Project Link]({{ item.url }}){% endif %}

  {{ item.description }}
{% endfor %}

# Publications and articles
{% for item in site.data.linkedin.Publications %}
* **{{ item.name }}**, *{{ item.publisher }}* ({{ item.published_on }})
  {% if item.url != "" %}[View Publication]({{ item.url }}){% endif %}

  {{ item.description }}
{% endfor %}

# Organizations
{% for item in site.data.linkedin.Organizations %}
* **{{ item.name }}** ({{ item.position }}) | {{ item.started_on }}
{% endfor %}
