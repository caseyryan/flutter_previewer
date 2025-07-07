import 'package:flutter/material.dart';

extension StringExtensions on String {
  String toSvgPath() => 'assets/svg/$this.svg';
  String toPngImagePath() => 'assets/images/$this.png';
  String toPngIconPath() => 'assets/icons/$this.png';
  String toJpgPath() => 'assets/images/$this.jpg';

  Image toAssetPngImage({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      toPngImagePath(),
      width: width,
      height: height,
      fit: fit,
    );
  }

  String removeLastSlashes() {
    return replaceAll(RegExp(r'/+$'), '');
  }

  String selectSurroundingTags({
    required int fromIndex,
    required int toIndex,
  }) {
    final stack = <Map<String, dynamic>>[];
    int i = 0;
    int? resultStart;
    int? resultEnd;

    while (i < length) {
      if (this[i] == '<') {
        final tagStart = i;
        i++;

        final isClosing = this[i] == '/';
        if (isClosing) i++;

        final nameStart = i;
        while (i < length && this[i] != ' ' && this[i] != '>') {
          i++;
        }
        final tagName = substring(nameStart, i);

        // Move to '>'
        while (i < length && this[i] != '>') {
          i++;
        }
        final tagEnd = i;
        i++; // past '>'

        if (!isClosing) {
          stack.add({'name': tagName, 'start': tagStart});
        } else {
          final index = stack.lastIndexWhere((t) => t['name'] == tagName);
          if (index != -1) {
            final openTag = stack.removeAt(index);
            final fullTagStart = openTag['start'] as int;
            final fullTagEnd = tagEnd + 1;

            if (fullTagStart <= fromIndex && toIndex <= fullTagEnd) {
              resultStart = fullTagStart;
              resultEnd = fullTagEnd;
            }
          }
        }
      } else {
        i++;
      }
    }

    if (resultStart != null && resultEnd != null) {
      return substring(resultStart, resultEnd);
    }

    return substring(fromIndex, toIndex);
  }

  int calculateNumLines({
    required String text,
    required TextStyle textStyle,
    required double maxWidth,
  }) {
    assert(textStyle.height != null, 'TextStyle.height must not be null');
    final TextSpan textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: null,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: maxWidth);
    return (textPainter.size.height / textStyle.height!).ceil();
  }


  String splitByCamelCase() {
    var words = split(RegExp(r"(?=[A-Z])"));
    return words.map((e) => _capitalizeString(e)).join(' ');
  }

  String toMaxLength(int maxLength, {String suffix = '…'}) {
    if (length <= maxLength) {
      return this;
    }
    return '${substring(0, maxLength - 1)}$suffix';
  }

  Color toColor({
    double saturation = .9,
    double lightness = .4,
  }) {
    var hash = 0;
    for (var i = 0; i < length; i++) {
      hash = codeUnitAt(i) + ((hash << 5) - hash);
    }

    var hue = (hash % 360).toDouble();
    return HSLColor.fromAHSL(
      1.0,
      hue,
      saturation,
      lightness,
    ).toColor();
  }


  String _capitalizeString(String string) {
    if (string.isEmpty) return string;
    return "${string[0].toUpperCase()}${string.substring(1)}";
  }

  String format(List<dynamic> args) {
    String result = this;
    int i = 0;

    return result.replaceAllMapped(RegExp(r'\{\}'), (match) {
      if (i < args.length) {
        return args[i++].toString();
      }
      return match.group(0) ?? '';
    });
  }
}
