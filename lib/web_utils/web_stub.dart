import 'dart:js_interop';

import 'package:flutter_previewer/controllers/project_controller.dart';

@JS()
external String getAuthData();

@JS()
external String getUserAgent();

/// этот код используется для быстрой авторизации, если браузер был открыт из телеги
@JS()
external String? getCodeFromUrl();

@JS()
external void openTelegramLink(String url);

@JS()
external void hapticFeedbackImpact(String value);

@JS()
external void hapticFeedbackNotification(String type);

@JS()
external void hapticFeedbackSelectionChanged();

@JS()
external void openLink(String url);

@JS()
external void setHeaderColor(String color);

@JS()
external String getColorScheme();

@JS()
external void toggleBackButton(bool isEnabled);

/// это будет вызываться со стороны JS
/// https://dart.dev/interop/js-interop/usage
@JS("onBackButtonPressed")
external set _onBackButtonPressed(JSFunction value);

void onBackButtonPressed() {
  if (!projectController.isToolbarVisible) {
    projectController.showToolbar();
  } else {
    toggleBackButton(false);
  }
}

/// тут можно задать все методы, которые должны вызываться со стороны JS
void setupMethodsFromJavascript() {
  _onBackButtonPressed = onBackButtonPressed.toJS;
}
