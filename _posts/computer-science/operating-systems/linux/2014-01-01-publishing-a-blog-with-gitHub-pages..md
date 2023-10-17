---
layout: post
lang: en
title:  "Publishing a website with GitHub Pages."
excerpt: ""
category: operating-systems
date:   2014-01-01 22:45:33
tags: [CMS]
comments: true
share: true
revision: 0
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




