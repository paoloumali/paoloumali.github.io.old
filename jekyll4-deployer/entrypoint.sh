#!/bin/bash

set -e

DEST="${JEKYLL_DESTINATION:-_site}"
REPO="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
BRANCH="gh-pages"

echo "Installing gems..."

JEKYLL_ENV=production bundle config path vendor/bundle
JEKYLL_ENV=production bundle install --jobs 4 --retry 3

echo "Building Jekyll site..."

JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,__prod.yml

echo "Publishing..."

cd ${DEST}

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -m "published by GitHub Actions"
git push --force ${REPO} master:${BRANCH}
