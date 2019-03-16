#!/bin/bash
bundle exec jekyll build
git add --all .
git commit -m "update r2019.03"
git push origin master --force-with-lease
