MarkdownPreview.View = function(sel) {
  this.sel = sel;
};

MarkdownPreview.View.prototype = {
  draw: function(formattedText) {
    this._updatePreview(formattedText);
  },

  _updatePreview: function (formattedText) {
    this._target().empty().append("<p>" + formattedText + "</p>");
  },

  _target: function() {
    return $(this.sel);
  }
};

