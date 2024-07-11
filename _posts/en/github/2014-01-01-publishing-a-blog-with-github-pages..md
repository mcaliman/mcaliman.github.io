---
layout: post
title:  "Publishing a website with GitHub Pages."
excerpt: ""
category: github
tags: [github pages]
date:   2014-01-01
comments: true
share: false
modified: 2024-07-11
published: true
---

If you want to publish the site at `http://USERNAME.github.com`, you need to create a repository (from your GitHub account) 
called `USERNAME.github.com`, in my case `mcaliman.github.com`

```bash
GITHUB_ACCOUNT=USERNAME
cd ${GITHUB_ACCOUNT}.github.com
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:${GITHUB_ACCOUNT}/${GITHUB_ACCOUNT}.github.com.git
git push origin master
```




