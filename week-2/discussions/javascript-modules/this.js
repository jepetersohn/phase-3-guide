// Javascript 'this' changes dynamically based on scope. We can even change the value of 'this' when we call a function.
var functionVar = function() { console.log(this.length) }
functionVar.apply("ab");
functionVar.apply([1,2,3]);

var Obj = {
  num: 0,
  increment: function() {
    console.log(++this.num);
  }
}

/* The following code will throw: Uncaught TypeError: Object [object HTMLAnchorElement] has no method 'render'
   because 'this' in the play function will now refer to the anchor tag rather than the game. This
   happens because we're using game.play as our callback function for the click event.
*/

$(document).ready(function() {
  var game = new Game
  $('a').on('click', game.play)
});

var Game = function() {}

Game.prototype.play = function() {
  this.render();
}

Game.prototype.render = function() {
  alert('yo')
}

// THIS IS THE PREFERRED SOLUTION:
/* Solution #1 (simple and preferred)
  wrap the game.play in an anonymous function and call game.play inside of it.
  In this case, game.play is not the callback function, the anonymous function
  takes care of that, which means 'this' is now the game.
*/

$(document).ready(function() {
  var game = new Game
  $('a').on('click', function() { game.play() })
});
// the rest of the code is the same

/* Solution # 2 (complex, less preferred)
  user jquery proxy, which allows you to change the context of functions bound to a click handler.
*/
$(document).ready(function() {
  var game = new Game
  $('a').on('click', $.proxy(game.plaxy, game))
});

Game.prototype.play = function(e) {
  this.render();
}

// DON'T DO THIS
/* Solution #3 (complex and ugly, don't do it)
  add data to the click event by setting an attribute called game(you can call it anything) to game {game: game}.
  In our play method we can access game by e.data.game.
*/

$(document).ready(function() {
  var game = new Game
  $('a').on('click', {game: game}, game.play)
});

Game.prototype.play = function(e) {
  var game = e.data.game;
  game.render();
}
