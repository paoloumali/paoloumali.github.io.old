#!/usr/bin/env bash

if [ $# -gt 0 ]; then

    if [ "$1" == "up" ]; then
        bundle exec jekyll serve --config _config.yml,_configDev.yml

    elif [ "$1" == "build" ]; then
        rm -rf public
        JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_configProd.yml

    else
        bundle "$@"
    fi
else
    bundle -v
    ruby -v
    echo gem $(gem -v)
    bundle exec jekyll -v
    bundle list
fi
