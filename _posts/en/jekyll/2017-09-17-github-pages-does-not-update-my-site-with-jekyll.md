--- 
layout: post
title: GitHub Pages does not update my site with Jekyll.
excerpt: Joys and sorrows of maintaining your own site with Jekyll.
category: Jekyll
comments: true
share: false
date: 2017-09-16
modified: 2024-07-11
published: true
tags: [jekyll, blog, en]
---

> If you have a procedure with ten parameters, you probably missed some.
>
> – Alan Perlis

If GitHub thinks your posts are 'in the future' it won't create them; the solution to our headache is rather trivial: tell Jekyll (and thus GitHub) to do it anyway, regardless of our timezone.

Add:

`future: true`

to our `_config.yml`.

And we commit it to our repo.
