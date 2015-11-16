#!/bin/bash

bundle exec nanoc

# source
git add .
git commit . --message="$1"
git pp

#output
cd public
git add .
git commit . --message="$1"
git pp

