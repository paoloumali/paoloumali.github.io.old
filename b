#!/usr/bin/env bash

if [ $# -gt 0 ]; then

    if [ "$1" == "up" ]; then
        bundle exec jekyll serve

    elif [ "$1" == "build" ]; then
        JEKYLL_ENV=production bundle exec jekyll build

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
