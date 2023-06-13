--- 
layout: post
lang: it
title: "Github pages non aggiorna il mio sito con jekyll."
excerpt: "Gioie e dolori di mantenere il proprio sito con jekyll."
category: computer-science
date:   2017-09-16 22:45:33
modified: 2017-09-17 09:00:33
tags: [CMS]
comments: true
share: true
---

Se Github pensa che i tuoi post sono "nel futuro" non li andrà a creare, la soluzione al nostro mal di testa è piuttosto banale, dire a jekyll (e quindi anche Github) di farlo lo stesso, a prescindere dalla nostra timezone.

Aggiungiamo

`future: true`

al nostro `_config.yml`

E committiamo il tutto sul nostro repo.
