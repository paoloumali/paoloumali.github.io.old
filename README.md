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
  - https://github.com/heroku/heroku-buildpack-static
