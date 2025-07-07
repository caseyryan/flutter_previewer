import 'package:flutter/foundation.dart';

String getAuthData() {
  return '';
}

String? getCodeFromUrl() {
  return 'native';
}

String getUserAgent() {
  return 'not web';
}

void openTelegramLink(String url) {
  debugPrint('openTelegramLink() is not implemented');
}

void openLink(String url) {
  debugPrint('openTelegramLink() is not implemented');
}

void hapticFeedbackImpact(String value) {
  debugPrint('HAPTIC FEEDBACK IMPACT: $value');
}

void hapticFeedbackNotification(String type) {
  debugPrint('HAPTIC FEEDBACK NOTIFICATION: $type');
}

void hapticFeedbackSelectionChanged() {
  debugPrint('HAPTIC FEEDBACK SELECTION CHANGED');
}

/// никогда не используется вне телеграм окружения
String getColorScheme() {
  return 'light';
}

void setHeaderColor(String color) {
  debugPrint('setHeaderColor() is not implemented');
}

void toggleBackButton(bool isEnabled) {
  debugPrint('toggleBackButton() is not implemented');
}

void setupMethodsFromJavascript() {
  debugPrint('setupMethodsFromJavascript() is not implemented');
}
