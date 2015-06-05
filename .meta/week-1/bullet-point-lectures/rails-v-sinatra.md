# Rails vs Sinatra

Note: Overview of creating a new rails application, point out comparisions to sinatra as you go

* (http://guides.rubyonrails.org/getting_started.html)[http://guides.rubyonrails.org/getting_started.html]
* ``rails`` command line
* ``rails new`` options

## Creating a new Rails Application
```
$ rails new blog -d foo
```

* databases - prefer ``postgresql``

```
$ rails new blog -d postgresql -T
```

## Walkthrough Generated Files
```
$ cd blog
$ tree -d
```

* Lots of stuff!
* Find correct version: (http://guides.rubyonrails.org/)[http://guides.rubyonrails.org/]

## Starting a Rails Application
```
$ rails s
```

OOPS :) We need to do a little more

### Initializing the Database
```
$ cat Rakefile
$ rake -T
```

```
$ rake db:create
```

```
$ rails s
$ open http://localhost:3000/
```

* TADA! - (Hopefully)

## Building Your Application

### Routing 
* ``$ cat config/routes.rb``
* ``$ rake routes``

### Models
* ``$ rails generate model Article title body:text``
* ``$ rake db:migrate``
* ``$ rails console`` (or ``rails c``)
* ``> Article.create!(:title => 'Hello World', :body => 'The answer is 42')``

### Controllers
* ``rails g controller articles index``
* But that generates some things we don't want....
* ``rails g controller articles index --no-helper --no-assets``
* ``redirect_to`` instead of Sinatra's ``redirect``

```
$ rails s
$ open http://localhost:3000/articles/index
```

### Routing Revisited
* ``$ rake routes``

### Views
* ERB the same as we did in Sinatra.
* Edit the controller and view to show the article created in the console

### And Go Do It!
* Review Routing Docs - [http://guides.rubyonrails.org/routing.html](http://guides.rubyonrails.org/routing.html)
* View Helpers ``link_to``
* Review layouts
* Add CSS in the assets folder
* RSpec

