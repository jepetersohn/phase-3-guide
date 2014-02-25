var Obj = {
  name: "object",
  fullName: function() {
    function() {
      return this.name;
    }
  }

}

Obj.fullName()
