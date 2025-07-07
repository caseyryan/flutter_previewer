part '_dictionary.dart';

String get selectedLocale => 'ru';

/// это только для форм!!!
String? translatorBuilder(String? value) {
  if (value != null) {
    return  (_liteFormTexts[value] ?? value).translate();
  }
  return value?.translate();
}
/// в формах всегда по английски, так что сначала переводим на русский, 
/// а потом, если надо на другой язык
final _liteFormTexts = {
  'Cancel': 'Отмена',
  'Done': 'Готово',
  'A phone is required': 'Нужно указать номер телефона',
  'A phone is invalid': 'Номер телефона неверный',
  'A password is required': 'Нужно указать пароль',
  'A password is invalid': 'Пароль неверен',
  'A code is required': 'Нужно указать код',
  'A code is invalid': 'Код неверен',
  'Invalid code': 'Неверный код',
  'Invalid phone': 'Неверный номер телефона',
  'Invalid password': 'Неверный пароль',
  'Invalid username': 'Неверное имя пользователя',
  'Username is required': 'Нужно указать имя пользователя',
};

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