---
layout: post
lang: it
title:  "Pubblicare un sito con GitHub Pages."
excerpt: ""
category: computer-science
date:   2014-01-01 22:45:33
tags: [Jekyll,GitHub,GitHubPages]
comments: true
share: true
---

L'informatica non riguarda i computer più di quanto l'astronomia riguardi i telescopi.
*(Edsger Dijkstra)*

Se vuoi pubblicare il sito all'indirizzo `http://USERNAME.github.com` devi creare una repository (dall'account GitHub) 
chiamato `USERNAME.github.com`, nel mio caso `mcaliman.github.com`

{% highlight bash %}
GITHUB_ACCOUNT=USERNAME
cd ${GITHUB_ACCOUNT}.github.com
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:${GITHUB_ACCOUNT}/${GITHUB_ACCOUNT}.github.com.git
git push origin master
{% endhighlight %}




