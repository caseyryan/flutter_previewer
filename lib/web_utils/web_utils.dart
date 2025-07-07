import 'package:flutter/material.dart';
import 'package:flutter_previewer/extensions/color_extensions.dart';

import 'native_stub.dart' if (dart.library.html) 'web_stub.dart';

enum Haptic {
  heavyImpact('heavy'),
  rigidImpact('rigid'),
  softImpact('soft'),
  errorNotification('error'),
  warningNotification('warning'),
  successNotification('success'),
  selectionChanged('selectionChanged');

  final String value;
  const Haptic(this.value);
}

bool get isTelegramMiniApp {
  final authString = WebUtils.telegramAuthData;
  return authString.isNotEmpty == true;
}

bool get isWebIOS {
  return WebUtils.isWebIos;
}

class WebUtils {
  static String get telegramAuthData {
    return getAuthData();
  }

  static void hapticFeedback(
    Haptic value,
  ) {
    switch (value) {
      case Haptic.heavyImpact:
      case Haptic.softImpact:
      case Haptic.rigidImpact:
        hapticFeedbackImpact(value.value);
        break;
      case Haptic.errorNotification:
      case Haptic.warningNotification:
      case Haptic.successNotification:
        hapticFeedbackNotification(value.value);
        break;
      case Haptic.selectionChanged:
        break;
    }
  }

  /// это код для авторизации в браузере, при переходе из телеги
  static String get loginCodeFromUrl {
    return getCodeFromUrl() ?? '';
  }

  static void openLinkViaTelegramBrowser(String url) {
    openLink(url);
  }

  static void mapJsToDart() {
    setupMethodsFromJavascript();
  }

  static void openTelegramUrl(String url) {
    debugPrint('OPENING TELEGRAM URL: $url');
    openTelegramLink(url);
  }

  static void openExternalUrl(String url) {
    debugPrint('OPENING EXTERNAL URL: $url');
    openLink(url);
  }

  static void toggleTelegramBackButton(bool isEnabled) {
    if (isTelegramMiniApp) {
      toggleBackButton(isEnabled);
    }
  }

  static bool get isDarkTelegramScheme {
    return getColorScheme().toLowerCase() == 'dark';
  }

  static bool get isWebIos {
    final agent = getUserAgent().toLowerCase();
    // consoleLog('USER AGENT: $agent');
    return (agent.contains('iphone') || agent.contains('ipad')) && !agent.contains('android');
  }

  static String get userAgent {
    return getUserAgent();
  }

  static set headerColor(Color color) {
    setHeaderColor(color.toSimpleHex(withAlphaChannel: false));
  }
}
