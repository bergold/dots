#!/usr/bin/env bash
set -e

cd build/web
git init
git config user.name "Drone.io"
git config user.email "emil.bergold@outlook.com"
git add .
git commit -m "Deploy to GitHub Pages"
git push --force "git@github.com:bergold/dots.git" master:gh-pages
