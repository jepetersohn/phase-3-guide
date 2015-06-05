// Functions in javascript are objects are first-class citizens:
// 1. can be stored in variables and data structures.
// 2. can be passed as a parameter to another function.
// 3. can be returned as the result of another function.

var functionVar = function(name) { console.log(name) }
function takesFunction(name, callback) {
  func("shadi");
}
function returnsFunction(arg1,  func) {
  return func;
}
takesFunction( function(){ console.log("hello") })
var func = returnsFunction(function(){ console.log("hello") })

takesFunction(functionVar(jdjd))
