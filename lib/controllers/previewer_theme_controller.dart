// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lite_state/lite_state.dart';

PreviewerThemeController get themeController {
  return findController<PreviewerThemeController>();
}

class PreviewerThemeController extends LiteStateController<PreviewerThemeController> {
  PreviewerThemeController() : super(preserveLocalStorageOnControllerDispose: true);

  ThemeMode get themeMode {
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  bool _hasSetTelegramColors = false;

  /// если это не true, то будет по умолчанию при каждом запуске ставить тему из телеги
  bool get hasSetCustomColorScheme {
    return getPersistentValue<bool>('hasSetCustomColorScheme') == true;
  }

  set hasSetCustomColorScheme(bool value) {
    setPersistentValue('hasSetCustomColorScheme', value);
  }

  void tryUpdateTelegramColors() {
    if (_hasSetTelegramColors) {
      return;
    }
    _hasSetTelegramColors = true;
    // WebUtils.headerColor =
        // isDarkTheme ? darkTheme.appBarTheme.backgroundColor! : lightTheme.appBarTheme.backgroundColor!;
  }

  Brightness get brightness {
    return isDarkTheme ? Brightness.dark : Brightness.light;
  }

  bool get isDarkTheme {
    // if (isTelegramMiniApp && !hasSetCustomColorScheme) {
    //   return WebUtils.isDarkTelegramScheme;
    // }
    return getPersistentValue<bool>('isDarkTheme') == true;
  }

  set isDarkTheme(bool value) {
    if (value) {
      hasSetCustomColorScheme = true;
    }
    setPersistentValue('isDarkTheme', value);
  }

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    rebuild();
  }

  void setTheme(bool isDark) {
    isDarkTheme = isDark;
    rebuild();
  }

  @override
  void reset() {}
  @override
  void onLocalStorageInitialized() {}
}
