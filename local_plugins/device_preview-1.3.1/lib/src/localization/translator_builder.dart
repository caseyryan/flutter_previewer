import 'package:flutter/widgets.dart';

part '_dictionary.dart';

String selectedLocale = 'en';

extension TranslateStringExtension on String {
  String translate() {
    if (_dictionary.containsKey(selectedLocale)) {
      final translation = _dictionary[selectedLocale]![this];
      if (translation != null) {
        return translation;
      } else {
        debugPrint('NOT TRANSLATED>>$this');
      }
    }
    return this;
  }
}