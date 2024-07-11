--- 
layout: post
title: Github pages does not update my site with jekyll.
excerpt: Joys and sorrows of maintaining your own site with Jekyll.
category: Jekyll
date:   2017-09-16
comments: true
share: false
modified: 2024-07-11
published: true
---

> If you have a procedure with ten parameters, you probably missed some.
>
> – Alan Perlis

If Github thinks your posts are 'in the future' it won't create them, the solution to our headache is rather trivial, tell jekyll (and thus Github) to do it anyway, regardless of our timezone.

We add

`future: true`

to our `_config.yml`.

And we commit it to our repo.
