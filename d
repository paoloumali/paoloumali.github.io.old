#!/usr/bin/env bash

if [ $# -gt 0 ]; then

    if [ "$1" == "install" ] || [ "$1" == "i" ]; then
      bundle install
      bundle binstubs jekyll

    elif [ "$1" == "update" ] || [ "$1" == "u" ]; then
      bundle u

    elif [ "$1" == "up" ] || [ "$1" == "serve" ]; then
        bin/jekyll s --config _config.yml,__dev.yml

    elif [ "$1" == "build" ] || [ "$1" == "b" ]; then
        rm -rf public
        JEKYLL_ENV=production bin/jekyll b --config _config.yml,__prod.yml

    else
        bundle "$@"
    fi
else
    which ruby
    which bundle
    bin/jekyll -v
fi
