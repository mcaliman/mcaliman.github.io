#!/bin/bash
#
# alt-gr+ì is ~
#
# clean code..
rm -r *~
# build site & run
bundle exec jekyll build
bundle exec jekyll serve