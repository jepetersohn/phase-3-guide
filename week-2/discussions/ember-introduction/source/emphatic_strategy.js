MarkdownPreview.EmphaticStrategy = function(raw) {
  this.raw = raw;
}

MarkdownPreview.EmphaticStrategy.prototype = {
  format: function() {
    var chars = this.raw.split(''),
      length = chars.length,
      isFormatting = false;
      i = 0,
      result = [];

    for (; i < length; i++) {
      c = chars[i];
      if (c === '*' && chars[i+1] !== '*' && chars[i-1] !== '*') {
        if (!isFormatting) {
          result.push("<em>");
          isFormatting = true;
        } else {
          result.push("</em>");
          isFormatting = false;
        }
      } else {
        result.push(c);
      }
    }

    return result.join('');
  }
}
