var createObj = (function(){
  var name = "object";
  var privatefullName = function() {
    return name;
  }
  return function() {}
}())
