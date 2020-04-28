#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

#git init
git pull git@github.com:jaydadhaniya/memory-game.git master:gh-pages
git add -A
git commit -m 'deploy'

git push -f git@github.com:jaydadhaniya/memory-game.git master:gh-pages

cd -
