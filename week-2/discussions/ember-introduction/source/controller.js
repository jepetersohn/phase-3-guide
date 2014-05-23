MarkdownPreview.Controller = function(opts, view) {
  this.sourceSelector = opts.sourceSelector;
  this.view = view;
};

MarkdownPreview.Controller.prototype = {
  init: function() {
    var self = this;

    $(this.sourceSelector).on('keyup', function() {
      self._updateView();
    });

    this._updateView();
  },

  _updateView: function() {
    this.view.draw(this._parse());
  },

  _parse: function () {
    var raw = $(this._source()).val();
    return new MarkdownPreview.Formatter(raw).format();
  },

  _source: function() {
    return $(this.sourceSelector);
  }
};
