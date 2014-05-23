MarkdownPreview.StrongStrategy = function(raw) {
  this.raw = raw;
}

MarkdownPreview.StrongStrategy.prototype = {
  format: function() {
    var chars = this.raw.split(''),
      length = chars.length,
      isFormatting = false;
      i = 0,
      result = [];

    for (; i < length; i++) {
      c = chars[i];
      if (c === '*' && chars[i+1] === '*') {
        if (!isFormatting) {
          result.push("<strong>");
          isFormatting = true;
        } else {
          result.push("</strong>");
          isFormatting = false;
        }
        i++;
      } else {
        result.push(c);
      }
    }

    return result.join('');
  }
}
