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

## Deploy

- Push to master

## Theme Notes

- activate submodule
  - $ ``git submodule add -b {branch} -f --name theme https://github.com/huenits/huenited.git theme``
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
