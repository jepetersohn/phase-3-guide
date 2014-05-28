MarkdownPreview.Formatter = function(raw) {
  this.STRATEGIES = [
    MarkdownPreview.EmphaticStrategy,
    MarkdownPreview.StrongStrategy
  ];
  this.raw = raw;
};

MarkdownPreview.Formatter.prototype = {
  format: function() {
      i = 0,
      isFormattingEm = false,
      isFormattingStrong = false,
      result = [];

    return this.randomizedStrategies().reduce(function(text, strategy) {
      return new strategy(text).format();
    }, this.raw);

    return result.join('');
  },

  randomizedStrategies: function () {
    return this.STRATEGIES.sort(function() {
      return 0.5 - Math.random()
    });
  }
}
