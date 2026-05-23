---
layout: post
title: "Publishing a website with GitHub Pages."
excerpt: "How to publish a website using GitHub Pages and Jekyll"
category: github
date: 2014-01-01
comments: true
share: false
modified: 2024-07-11
published: true
tags: [github, pages, en, code]
permalink: /github/publishing-website-github-pages/
---


If you want to publish the site at `http://USERNAME.github.io`, you need to create a repository (from your GitHub account) 
called `USERNAME.github.io`, in my case `mcaliman.github.io`.

```bash
GITHUB_ACCOUNT=USERNAME
cd ${GITHUB_ACCOUNT}.github.io
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:${GITHUB_ACCOUNT}/${GITHUB_ACCOUNT}.github.io.git
git push origin master
```

