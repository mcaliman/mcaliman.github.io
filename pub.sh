#!/bin/bash
bundle exec jekyll build
git add --all .
git commit -m "update"
git push origin master --force-with-lease
