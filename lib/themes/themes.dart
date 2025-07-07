import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';

import 'theme_extensions/custom_color_theme.dart';
import 'theme_extensions/custom_text_theme.dart';

part '_custom_light_theme.dart';
part '_custom_dark_theme.dart';

const useMaterial3 = false;

// Define Telegram brand colors
const customPrimaryColor = Color(0xFF3b82f6);
const customPrimaryColorLighter = Color.fromARGB(255, 108, 164, 255);


Map<int, Color> get lightThemeColorShades => {
  50: customPrimaryColor.withValues(alpha: 0.1),
  100: customPrimaryColor.withValues(alpha: 0.2),
  200: customPrimaryColor.withValues(alpha: 0.3),
  300: customPrimaryColor.withValues(alpha: 0.4),
  400: customPrimaryColor.withValues(alpha: 0.5),
  500: customPrimaryColor, 
  600: customPrimaryColor.withValues(alpha: 0.6),
  700: customPrimaryColor.withValues(alpha: 0.7),
  800: customPrimaryColor.withValues(alpha: 0.8),
  900: customPrimaryColor.withValues(alpha: 0.9),
};
Map<int, Color> get darkThemeColorShades => {
  50: customPrimaryColor.withValues(alpha: 0.1),
  100: customPrimaryColor.withValues(alpha: 0.2),
  200: customPrimaryColor.withValues(alpha: 0.3),
  300: customPrimaryColor.withValues(alpha: 0.4),
  400: customPrimaryColor.withValues(alpha: 0.5),
  500: customPrimaryColor, // Default color
  600: customPrimaryColor.withValues(alpha: 0.6),
  700: customPrimaryColor.withValues(alpha: 0.7),
  800: customPrimaryColor.withValues(alpha: 0.8),
  900: customPrimaryColor.withValues(alpha: 0.9),
};


ThemeData get lightTheme {
  return CustomLightTheme.theme;
}

ThemeData get darkTheme {
  return CustomDarkTheme.theme;
}


