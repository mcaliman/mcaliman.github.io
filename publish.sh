#!/bin/bash
bundle exec jekyll build
git add --all .
git commit -m "update blog_v2017"
git push origin master
