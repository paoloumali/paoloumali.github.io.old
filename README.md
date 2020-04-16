# paoloumali.github.io

Repo: https://github.com/paoloumali/paoloumali.github.io  
Github Pages: https://paoloumali.github.io  
Heroku Staging: https://pu-com.herokuapp.com  
Prod: https://www.paoloumali.com


## Requirements

- ruby: $ ``sudo apt-get install ruby-full``
- bundler: $ ``gem install bundler``

## Alias commands

- do: 
  ```bash
  chmod +x ./d
  alias d="./d"
  ```
  
## Local setup

- $ ``d install``
- $ ``d up``
- Browse http://localhost:4000
- $ ``d build``, to build prod

## Deploy Notes

- Deploy master(prod built jekyll site) to live domain
- A GH Action (sample [template](https://github.com/Paolo-WWW/jekyll4-deploy-gh-pages.git)) was merged to this repo

## Theme Notes

- activate submodules
  - $ ``git submodule add -f --name jekyll-theme https://github.com/huenits/huenited.git jekyll-theme``
  - $ ``git submodule add -f --name jekyll-docs https://github.com/Paolo-WWW/pu-jekyll-docs.git jekyll-docs``
- gem-based theme: huenited is being used
- can be overriden by replicating then modifying the following:  
  - _includes 
  - _layouts
  - _sass
  - assets
- tips: symlink from theme repo, then edit while $ ``d up``

## VSCode extensions

- Liquid

## Heroku notes

- https://blog.heroku.com/jekyll-on-heroku
- buildpacks
  - heroku/php
  - https://github.com/heroku/heroku-buildpack-static
- Nginx redirect  
  
  ```conf
  index index.html;
  error_page 404 /404.html;

  # redirect all trail slash and .html
  rewrite ^(.+)/$ $1 permanent;
  rewrite ^(.+)\.html$ $1 permanent;

  # fallbacks
  location ~ ^(.+)$ {
    # First attempt to serve request as file, then
    # as .html
    # as directory, then fall back to displaying a 404.
    try_files $uri $uri.html $uri/index.html $uri/ =404;
  }

  ```  
-

## Github Actions/CI notes

- https://github.com/marketplace/actions/jekyll-4-build-deploy
