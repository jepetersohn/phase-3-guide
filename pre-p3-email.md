Greetings,

Welcome to Phase III.  As your instructor(s) will further detail, we need to go
fast in this phase so that we can make the best final projects possible, as
well as prepare you for the job market.

In order to prepare yourselves for next week you will need to invest time this
weekend (~16-20 hours) to be at peak performance on next Monday.

1.  Type along with Cows on Rails (below)
2.  Work through the [intro-to-rails-challenge](https://github.com/eastern-moose-2014/intro-to-rails-challenge)

## Cows on Rails (~ 1 hour)

We will spend several of our opening hours together getting to understand
Rails.  As a friendly (and, frankly, silly) introduction to doing work with
Rails, NYC's own Steven Cassidy has prepared the following type-along exercise.
The concepts presented here are not exhaustive, but typing along will help you
establish important landmarks in the Rails ecosystem.

We recommend you have this file open in a browser and that you follow the steps
in a terminal window.  Please "type along" &mdash; don't merely _read along_:
get the knowledge about what to do in your fingers _as well as_ your brain.
Also note the _process_ described in this document.  It was written by an
industry veteran with years of experience.  In this document he shows you how
professionals engage in _directed play_ to get their bearings.  This skill can
be applied to _any_ language and is the _key_ as to how experienced developers
can learn so many languages to a basic level of proficiency quickly.

## Intro To Rails Challenge (~ 10 hours)

This is a challenge unlike others you have seen.  It's an exploratory
challenge.  It is comprised of 13 branches that you are to visit.  Each branch
features a changed Readme.md to guide you in your exploration of Rails.  **You
should be able to bounce the theories presented in this exercise off of the
practical work you did in Cows on Rails**.  As you explore each of the branches
take notes: What are the key files? What is the assumption that's made here.

* You **will not** be sumitting pull requests based on changes
* This challenge forms the "required vocabulary" for our first week

Please record and research any questions you might have.  Come Monday we'll be
jumping into the deep end of Rails

## Bugs Clarifications Etc.

Your instructor(s) is an e-mail addict and will see any emails that you send
detailing "X doesn't work" or "Y isn't there" &mdash; even nights and weekends.
Please pass them along if you have issues.  Otherwise &mdash; excelsior!

-- Your Phase III teachers

----

### Cows on Rails

If you want to try the "error driven development" we did today, the basic steps
are as follows. I found doing this very helpful when I was first learning
rails. Rails should pick up changes automatically when you save files. You may
want to git init . in your app folder after creating the app and commit your
steps as you make them so you can get back to any state of your application
later.

Setup:

In terminal create a new application: `rails new app_name -T -d postgresql`

That will create a folder called app_name under your current directory. That's
where all your app's files live. The -T switch tells rails not to use
"minitest" - the bundled testing framework. The -d tells rails to expect to use
postgres rather than sqlite.  Still in terminal cd  app_name and open the
folder in sublime (often subl . in terminal will work, but if that doesn't work
go into sublime and do File, Open Folder and point the file chooser to the
app_name folder rails just created.  In terminal, cd to your app_name folder if
you are not already there, run rake db:create db:migrate to create your
database, then enter rails s to start the rails server.

In a browser, go to http://localhost:3000 - you should see the welcome to ruby
on rails page.

You now have a running rails app. It just won't do much until we add some
resources, models, views and controllers. That cycle (along with writing tests
which we'll leave aside for now) is the main set of tasks of developing the
app. I'll go through a simple example here.

1) Add a resource declaration in config/routes.rb somewhere after the first
line. e.g add  resources :cows on its own line.  Go back to terminal and type
(you may need to open a new window and possibly cd to your app_name folder
depending on your machine's setup.) In the terminal window type rake routes and
hit return. (Incidentally this output is also accessible as
http://localhost:3000/rails/info in your browser while in development.)

You should see:

          Prefix Verb   URI Pattern              Controller#Action
            cows GET    /cows(.:format)          cows#index
                 POST   /cows(.:format)          cows#create
         new_cow GET    /cows/new(.:format)      cows#new
        edit_cow GET    /cows/:id/edit(.:format) cows#edit
             cow GET    /cows/:id(.:format)      cows#show
                 PATCH  /cows/:id(.:format)      cows#update
                 PUT    /cows/:id(.:format)      cows#update
                 DELETE /cows/:id(.:format)      cows#destroy

Rails has created a number of standard REST-style routes for us, and this
screen is telling us how it expects us to implement them. When we call 'GET
/cows' from a browser, rails will try to find a cows controller (implemented as
class CowsController in a file called cows_controller.rb in app/controllers)
and call an index method on it. When we 'POST /cows' it will try create a new
cow resource by calling an action/method called create on that same controller.
And so on

So, try http://localhost:3000/cows. You should see an error page reading
"Routing Error uninitialized constant CowsController"

We need to create the cows controller. In sublime create a new file in the
app/controllers folder. Save it as cows_controller.rb and define a class called
CowsController in that file. The class should look like

    class CowsController < ApplicationController
    end

Rails created the ApplicationController class for us, as a base class for our
controllers. Our controller classes should all inherit from (or subclass or
extend, to use other synonyms) the ApplicationController class.

Note that you have to call the class CowsController and save it in a file
called cows_controller.rb for things to work without any extra configuration.
Rails favors "convention over configuration" in many ways, and this is one of
them. If you name your files and classes the way it expects you to, lots of
things "just work."

So back to the browser. Refresh. The error changes to "The action 'index' could
not be found for CowsController." Remember from the routing table above that
rails expects to serve the /cows resources by calling an index method on a
CowsController. For now I just add:

      def index
        @cows = [0,1,2]
      end

to the cows_controller.rb. This is creating an instance variable called cows on the controller assigning a short array of ints to it. Click refresh in the browser. Now I get error "Missing template cows/index" Rails is telling me it expected to find a view (template == view in rails) called index in a cows folder. Back in sublime, create a cows folder under app/views and save some text into file index.html.erb. I made mine like:

    <% @cows.each do |cow| %>
     Cow: <%= cow %>  <br>
    <% end %>

Now I refresh my page and I get:

    Cow: 0  
    Cow: 1  
    Cow: 2  

So we are there. We created a collection in the controller and iterated through it in the template (view.) Of course a real world collection ofcows would be more interesting than a collection of numbers. So we'll create a database table to store our cows and a model to represent them.

Back in terminal: rails g migration create_cows
When I run this at home I see

    $ rails g migration create_cows
          invoke  active_record
          create    db/migrate/20141004222735_create_cows.rb

The content of the migration file is 

    class CreateCows < ActiveRecord::Migration
      def change
        create_table :cows do |t|
        end
      end
    end

I edit it to include some fields so it reads

    class CreateCows < ActiveRecord::Migration
      def change
        create_table :cows do |t|
          t.string :name
          t.string :breed
          t.timestamps
        end
      end
    end

and run rake db:migrate.  You should see something like

    == 20141004222735 CreateCows: migrating =======================================
    -- create_table(:cows)
       -> 0.0541s
    == 20141004222735 CreateCows: migrated (0.0542s) ==============================

Now we need an ActiveRecord model class for our cows. Under app/models create a
file called cow.rb. Save it. Now in terminal start the rails console. Type
rails c or rails console. Note that it's rails not rake console.

If I try to load Cows now by calling Cow.all I get:
    $ rails c
    Loading development environment (Rails 4.1.5)

    2.1.1 :001 > Cow.all
    LoadError: Unable to autoload constant Cow, expected /Users/steven/tmp/tmp/app_name/app/models/cow.rb to define it

You can see rails automagic in action again. Rails knew to expect the cow model
to be defined in app/models/cow.rb - but we saved an empty file there so it
didn't see it any such definition. Update the cow.rb file to read

    class Cow < ActiveRecord::Base
    end

Back in the console, type reload! to make rails reload the cow definition. Now type Cow.all again. You should see

    2.1.1 :001 > Cow.all
      Cow Load (0.5ms)  SELECT "cows".* FROM "cows"
     => #<ActiveRecord::Relation []> 

(If you get an error at this point, exit out of the rails console and go back
in to force it to do a full reload.)

You can see rails queried the database but got back an empty set because we
haven't added any cows yet. However, if you type "Cow" on its own and hit
return you see what attributes rails knows exist on a cow (from reading the
database structure.)

    2.1.1 :002 > Cow

     => Cow(id: integer, name: string, breed: string, created_at: datetime, updated_at: datetime) 

So let's create a couple of cows. Rails gives back a lot of output to tell us what it's doing at each step. My input typing is in bold

    2.1.1 :003 > Cow.create({name: 'Flossy', breed: 'holstein'})

       (0.2ms)  BEGIN
      SQL (18.3ms)  INSERT INTO "cows" ("breed", "created_at", "name", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["breed", "holstein"], ["created_at", "2014-10-04 22:37:44.524753"], ["name", "Flossy"], ["updated_at", "2014-10-04 22:37:44.524753"]]
       (0.6ms)  COMMIT
     => #<Cow id: 1, name: "Flossy", breed: "holstein", created_at: "2014-10-04 22:37:44", updated_at: "2014-10-04 22:37:44"> 


    2.1.1 :004 > Cow.create({name: 'Daisy', breed: 'angus'})

     (0.2ms)  BEGIN
      SQL (0.4ms)  INSERT INTO "cows" ("breed", "created_at", "name", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["breed", "angus"], ["created_at", "2014-10-04 22:38:07.026496"], ["name", "Daisy"], ["updated_at", "2014-10-04 22:38:07.026496"]]
       (7.1ms)  COMMIT
     => #<Cow id: 2, name: "Daisy", breed: "angus", created_at: "2014-10-04 22:38:07", updated_at: "2014-10-04 22:38:07"> 


    2.1.1 :005 > Cow.all
    Cow Load (0.8ms)  SELECT "cows".* FROM "cows"
   => #<ActiveRecord::Relation [#<Cow id: 1, name: "Flossy", breed: "holstein", created_at: "2014-10-04 22:37:44", updated_at: "2014-10-04 22:37:44">, #<Cow id: 2, name: "Daisy", breed: "angus", created_at: "2014-10-04 22:38:07", updated_at: "2014-10-04 22:38:07">]> 

So we can now add a bit of behavior to our cow. Add this method to cow.rb:

    def moo
      "Moo from #{name}"
    end

Back in the console we can reload! again then

    2.1.1 :001 > Cow.first.moo
      Cow Load (0.8ms)  SELECT  "cows".* FROM "cows"   ORDER BY "cows"."id" ASC LIMIT 1
     => "Moo from Flossy" 

I want my /cows resource to show my list of cows. So back in the controller we edit the index method so that it does

      @cows = Cow.all (in place of the @cows = [0, 1, 2]

In the browser, refresh http://localhost:3000/cows. You should see something like 

    Cow: #<Cow:0x00000106563a18> 
    Cow: #<Cow:0x00000106522950> 

This is not surprising. We didn't give cow a to_s method so ruby uses the inherited version that just gives us the class name and an address in memory. But it does show us that rails is now loading our cows. To see better output we can change the template  to 

    <% @cows.each do |cow| %>
     <%= cow.moo %>  <br>
    <% end %>

Now when you refresh in the browser you see
Cow: Moo from Flossy 
Cow: Moo from Daisy 

The view is calling the moo method on each cow in the collection in turn.


SOOOO, that's one action from beginning to end. You might next want to support looking at one cow from the collection, so try 
http://localhost:3000/cows/1
We can see from the routing table that GET /cows/:id is going to match cows#show.
So we already know we'll need to create
A show method in the cows_controller.rb file
A app/views/cows/show.html.erb file

Some things to think about:

* What if I wanted a "latest" page like /cows/latest. How would I implement that? Have a look at 2.10.1 Adding Member Routes and 2.10.2 Adding Collection Routes in http://guides.rubyonrails.org/routing.html
* Our cows are not very interesting as they stand. How about we add columns for their biography. How would we do that with a migration without having to delete our existing cows? Do we need to change the model?
* What difference would resource :something rather than resources: something in routes.rb make to the generated routes. Try it and see.
* How does rails make link_to to work as a post when links normally cause get requests?
* Inside a rails action try adding p request as the first line to see what information about the request from the browser is readily available to you. Try p params as well.
* Try generating a "scaffold" for another model.  The documentation is at http://guides.rubyonrails.org/command_line.html 
* Take a look at the files it generates. Note the use of helpers like link_to, form_for and so on. Try listing out as many as you can find and read their documentation.

