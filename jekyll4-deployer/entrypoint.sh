#!/bin/bash

set -e

DEST="${JEKYLL_DESTINATION:-_site}"
REPO="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
BRANCH="gh-pages"

echo "JEKYLL_ENV: ${JEKYLL_ENV}"
echo "Installing gems..."

bundle config path vendor/bundle
bundle install --jobs 4 --retry 3

echo "Building Jekyll site..."

if [ ${JEKYLL_ENV} == production ]
  then
    bundle exec jekyll build --config _config.yml,__prod.yml
  else
    bundle exec jekyll build --config _config.yml,__dev.yml
fi

echo "Publishing..."

: <<'END'

cd ${DEST}

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -m "published by GitHub Actions"
git push --force ${REPO} master:${BRANCH}

END

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add -A
git commit -m "published by GitHub Actions"
git push --force ${REPO} master:${BRANCH}
