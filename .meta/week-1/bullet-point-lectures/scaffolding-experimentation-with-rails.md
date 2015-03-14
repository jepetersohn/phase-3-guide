# More Rails

*Note: Remember you may already have a blog_development database*

## Adding RSpec
* Create without test folder
```
$ rails new blog -d postgresql -T 
```

* Add Rspec to Gemfile
```
gem 'rspec-rails'
```

* Install and Generate
```
$ bundle install
```

* Run the RSpec installation generator
```
$ rails g rspec:install
```
Which creates the spec folder with rails_helper.rb   spec_helper.rb

* Run RSpec
```
$ rspec
```

## Remove CoffeeScript
* Optional Depending on your Viewpoint:
  * [http://cholla.mmto.org/computers/web/rails/coffeescript.html](http://cholla.mmto.org/computers/web/rails/coffeescript.html)
  * [http://blog.differential.com/why-coffeescript/](http://blog.differential.com/why-coffeescript/)

## Simple Generators
``rails generate model Article title body:text``

## Scaffolding and Controller Generators
* Powerful but problematic
* Generate a lot of code you may not understand
* Make sure you have a clean git staging area before generating
* Generate and Review ``git diff``
* ``$ rails d ...XXXX`` to undo or ``git reset HEAD``

## Scaffold Demo
* ``$ rails generate scaffold Articles title body:text``
* ``$ rails s``
* ``$ open http://localhost:3000/``
* ``$ rake routes``
* ``$ open http://localhost:3000/articles``

## Routing
* Review Routes
* ``resouces`` 
* ``member`` and ``collection``

## Scaffolded Files
* Review all the generated files

## Controller Details
* ``before_filter``
* ``before_action``
* Strong Parameters

## Route Helpers
* ``article_path``
* ``article_url``
* ``root_path``

## Views
* Partials
* *View Helpers* only available in the view - formatting

## Concerns
* Share Functionality
* [Routing Concerns](http://ruby-journal.com/how-to-dry-your-rails-routes/#dry-with-rails-4)
* Model Concerns

## Security
* [http://guides.rubyonrails.org/security.html](http://guides.rubyonrails.org/security.html)




