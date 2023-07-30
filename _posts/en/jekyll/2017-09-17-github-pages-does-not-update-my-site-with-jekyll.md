--- 
layout: post
lang: en
title: "Github pages does not update my site with jekyll."
excerpt: "Joys and sorrows of maintaining your own site with Jekyll."
category: Jekyll
date:   2017-09-16 22:45:33
modified: 2017-09-17 09:00:33
tags: [CMS,English]
comments: true
share: true
---

If Github thinks your posts are 'in the future' it won't create them, the solution to our headache is rather trivial, tell jekyll (and thus Github) to do it anyway, regardless of our timezone.

We add

`future: true`

to our `_config.yml`.

And we commit it to our repo.
