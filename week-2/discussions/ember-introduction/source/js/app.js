App = Ember.Application.create();

App.Router.map(function() {
  this.route("about"),
  this.route("town"),
  this.route("md")
});

App.IndexRoute = Ember.Route.extend({
  model: function() {
    return ['red', 'yellow', 'blue'];
  }
});

App.MdRoute = Ember.Route.extend({
  defaultText:  "You can use markdown!",

  model: function() {
    return App.MarkdownThing.create();
  }
});

App.MarkdownThing = Ember.Object.extend({
    USE_MARKED: false,

    defaultText:  "You can use markdown!",

    markdownText: function() {
      /* Note, with good OO we can switch between the marked() as the formatter to
       * use and our own MarkdownFormatter class!
       */

      if (this.get('USE_MARKED')) {
        return new Handlebars.SafeString(marked(this.get('defaultText')));
      } else {
        return new Handlebars.SafeString(new MarkdownPreview.Formatter(this.get('defaultText')).format());
      }
    }.property('defaultText'),

    defaultTextObserver: function() {
      console.log('whoa it got updated!')
    }.observes('defaultText')
});

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
