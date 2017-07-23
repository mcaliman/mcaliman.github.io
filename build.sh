#!/bin/bash
#
# alt-gr+ì is ~
#
rm *.*~
git add --all .
git commit -m "update"
git status
#
bundle exec jekyll build