#!/bin/bash
#
# alt-gr+ì is ~
#
# clean code..
rm -r *~
# build site
bundle exec jekyll build
# update repo
git add --all .
git commit -m "update"
git status