#!/bin/bash
bundle exec jekyll build
git add --all .
git commit -m "optimizations"
git push origin master --force-with-lease
