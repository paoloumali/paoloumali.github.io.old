#!/usr/bin/env bash

if [ $# -gt 0 ]; then

    if [ "$1" == "install" ] || [ "$1" == "i" ]; then
      bundle config path vendor/bundle
      bundle install --jobs 4 --retry 3

    elif [ "$1" == "update" ] || [ "$1" == "u" ]; then
      bundle u

    elif [ "$1" == "up" ] || [ "$1" == "serve" ]; then
        bundle exec jekyll s --config _config.yml,__dev.yml

    elif [ "$1" == "build" ] || [ "$1" == "b" ]; then
        rm -rf public
        JEKYLL_ENV=production bundle exec jekyll b --config _config.yml,__prod.yml

    else
        bundle "$@"
    fi
else
    which ruby
    which bundle
    bundle exec jekyll -v
fi
