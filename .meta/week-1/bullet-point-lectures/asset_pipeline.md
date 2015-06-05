#Asset Pipeline

#Bullet Points
* [Rails Guides Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html)
* Any file in any subfolder:
  * ``app/assets``, ``lib/assets``, ``vendor/assets``, + gems...
* demo text file in assets subfolder
  * [http://localhost:3000/](http://localhost:3000/)
* JavaScript
  * concatenate <- In Production
  * compression <- In Production (uglify)
  * mainfest file in comments often ``app/assets/javascripts/application.js`` 
  * pre-process erb or coffee
* CSS 
  * concatenate <- In Production
  * compression <- In Production (yui?)
  * mainfest file in comments often ``app/assets/stylesheets/application.css`` 
  * [http://localhost:3000/styles](http://localhost:3000/styles)
* Production Fingerprinting 
  * [PizzaShack](http://pizzashack.herokuapp.com/)
* Asset Precompile
  * Prior to deployment you can precompile the assets
  * If off for demoing:
    * In: ``config/environments/production.rb'
    * Set: ``config.assets.compile = true``
  * Do it for real production:
    * During deployment (on target server or pre deploy in temp repo) 
    * ``$ RAILS_ENV=production bin/rake assets:precompile``
    * I think heroku looks for the generated manifest file to detect ``manifest-md5hash.json``
* Which Folders?
  * ``Rails.application.config.assets.paths``
  * Intialized at startup?
* Bonus
  * ``index`` manifests for libraries 
* Helpers:
```
<%= stylesheet_link_tag "application", media: "all" %>
<%= javascript_include_tag "application" %>
```
* Manifests
  * ``require_tree .`` <-  order unspecified
  * ``require _self`` <- This file's contents
  * ``require xxxxx``
  * ``require`` does not include files twice 
* Pre-processing
  * based on file extensions 
  * CSS: pre-process erb and sass
  * JavaScript: pre-process erb and coffee
  * ``app/assets/stylesheets/projects.css.scss.erb`` is first processed as ERB, then SCSS, and finally served as CSS. T
  * app/assets/javascripts/projects.js.coffee.erb`` is processed as ERB, then CoffeeScript, and served as JavaScript.

#Related Docs
* [Asset Pipeline for Dummies](http://coderberry.me/blog/2012/04/24/asset-pipeline-for-dummies/)
* [Rails Guides Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html)
* [Asset Precompile](http://www.sitepoint.com/asset-precompile-works-part/)
* [Uses Sprockets](https://github.com/sstephenson/sprockets)
* [Railscasts](http://railscasts.com/episodes/279-understanding-the-asset-pipeline)
