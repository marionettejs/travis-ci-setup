#!/bin/bash -e

set -o pipefail

echo "$TRAVIS_BRANCH"

if [ "$TRAVIS_BRANCH" = "master" ] && [ "$TRAVIS_PULL_REQUEST" = "false" ]
then
  git clone https://github.com/marionettejs/marionettejs.com
  cd marionettejs.com
  sed -i 's/git@github.com:/https:\/\/github.com\//' .gitmodules
  npm run setup
  npm i
  echo "Deploying!"
  bower i
  npm run compile-all
  cp CNAME dist
  cd dist
  git init
  git config user.email "travis@marionettejs.com"
  git config user.name "TRAVIS-CI"
  git add .
  git commit -m "deploy"
  git push --force --quiet "https://${GH_TOKEN}@github.com/marionettejs/marionettejs.com.git" master:gh-pages > /dev/null 2>&1
fi
