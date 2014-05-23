# Ember.JS

Since we've been building OO JS MVC frameworks by hand for the last several
days and weeks, we've started identifying some pain-points.

## Pain Points

### Boilerplate

I (and your Phase 2 instructor) have given you a series of formulaic "chants"
of which objects to create in order to create an "OO JS MVC."  You're surely
tired of rewriting the name over and over again.  Dont' you wish that you could
give up a little bit of control and *gain* a lot more power?  In the same way
that you gave up a little control moving from Sinatra to Rails, you *gained* a
lot of ease by following conventions and getting the universe of `rails new`
for free!

### Manual Updating of the View

Our standard design approach is that a Controller manages something like a
"core data collection" which we update via a setter.

    aWidgetController.addGroceryItem(item)

Internally, `WidgetController` implements `addGroceryItem` something like the
following:

    addGroceryItem: function(item) {
      this.itemsCollection.push(item);
      this.view.paint(this);
    }

Wouldn't it be great if somehow we could have things in the DOM "automagically"
update when we modified the data?

### Synchronization of the JavaScript Data Model State to the Back-end

While we don't touch on this, if you update a representation of a resource (a
GroceryItem in Ruby-land) by updating its data representation in JavaScript
land, you'd like those changes to be synchronized back (i.e. a `PATCH` happens
magically for free).

These are things you are missing, you should critically review the available
options to find an option that fills these needs.  [Ember.JS][] is *a* solution
to this problem.  **NB**:  It's not necessarily the *best* solution, but it's
one that you should critically evaluate.

## Ember.JS

For each of these major points above, Ember provides a built-in solution.

1.  Boilerplate code is reduced
2.  Synchronization between data models to the DOM happens for free
3.  Data synchronization to the back end is available (using Ember Data)

Above this, Ember has some opinions that are important

### URLs Are Sacrosanct

The Ember committers believe that URLs are the most important feature of the
web.  A URL refers to a standardized experience of a resource on the web.
Consider your naive implementations of OOJS frameworks: can you copy the URL at
the top of the browser, chat it to a friend, and have that friend have the same
experience?  No.

The Ember core team thinks that this should be possible.  They view each
possible experience of your application ("state") as uniquely mapping to a URL.
Thus by passing your application that URL -- be it from your computer or Aunt
Tillie's in Kenosha -- you should both see the same data: the same grocery
store list and shopping care, the same grove of orange trees.

To enable this they have a "router" (a la `routes.rb`) which specifies which
state should be loaded per URL (just like Rails!  No surprise -- one of Ember's
core designers is Yehuda Katz who built huge parts of Rails 3).

Furthermore, if a given route or "state" needs data from the back end (i.e.
needs to make an AJAX request), Ember can understand how to take those URL
parameters and make the AJAX request to the back end.  If your back end (e.g.
Rails or NodeJS) uses REST, the integration Just Works(tm).

### Computed Properties and Uniform Access

Consider:

    // Just showing you yet another way to create classes in JavaScript ;)
    var person_protoype = {
      fullName: function() {
        return this.firstName + " " + this.lastName;
      }
    }

    var hooky = Object.create(PersonProtoype, {
      firstName: { value: "Peter"},
      lastName:  { value: "Hook"},
    });

    console.log(hooky.fullName()); // A most lyrical of bassists

It strikes me, for one, that it's odd that I have to use `hooky.firstName` and
`hooky.lastName` but to get a composed, or "composite" result back, I have to
use the `()` to dereference the function i.e. `hooky.fullName()`.  Referring to
`hooky.fullName`, obviously, would get me the function itself, not its
invocation.  Ember feels that this difference in interface is against the
[Uniform Access Principle][UAP], and all attributes, be they computed or
"simple," should have a uniform interface for retrieval:
`hooky.get('firstName')` and `hooky.get('fullName')` work the same way.

By virtue of this uniform access, calls to properties in Handlebars "just
work" e.g.:

    {{#each bassists}}
      {{lastName}}, {{firstName}}:  {{fullName}}
    {{/each}}

This design decision, while small, has a multiplicity of wonderful effects that
create clean interfaces and joyous programmers.

Here's the Person class in Ember:

    App.Person = Ember.Object.extend({
      init: function() {
        console.log('some interesting stuff we can do on initialization');
      },

      fullName: function() {
        return (this.get('firstName') + " " + this.get('lastName'));
      }.property('firstName', 'lastName'),

      height: 160,

      grow: function() {
        this.set('height', this.get('height') + 10);
      },

      heightCommenter: function() {
        alert('someone grew');
      }.observes('height')
    });


## Further

During my regular invovlement with the Ember design process, I saw the core
team consistently make major re-writes and re-factors in order to make the
design considereations described above be consistent and predictable.  Design
is an evolutionary process.  It requires a commitment to simplicity and a high
level of empathy for the users of your framework.

Ultimately when we consciously design our applications we make sure our
framework users will always have elegant and joyful interface -- even when
those users will only be our future selves!

[Ember.JS]: http://emberjs.com
[UAP]: http://en.wikipedia.org/wiki/Uniform_access_principle
