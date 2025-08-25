part '_dictionary.dart';

String get selectedLocale => 'ru';

extension TranslateStringExtension on String {
  String translate() {
    if (_dictionary.containsKey(selectedLocale)) {
      final translation = _dictionary[selectedLocale]![this];
      if (translation != null) {
        return translation;
      }
    }
    return this;
  }
}