import 'package:device_preview/src/state/state.dart';
import 'package:flutter/material.dart';

extension ThemeBackgroundExtension on DevicePreviewBackgroundThemeData {
  /// Converts a [DevicePreviewBackgroundThemeData] to a [ThemeData].
  ThemeData asThemeData() {
    switch (this) {
      case DevicePreviewBackgroundThemeData.dark:
        return ThemeData.dark();
      case DevicePreviewBackgroundThemeData.light:
        return ThemeData.light();
    }
  }
}

extension ThemeToolbarExtension on DevicePreviewToolBarThemeData {
  /// Converts a [DevicePreviewToolBarThemeData] to a [ThemeData].
  ThemeData asThemeData() {
    switch (this) {
      case DevicePreviewToolBarThemeData.dark:
        final base = ThemeData.dark();
        const accentColor = Colors.white;
        return base.copyWith(
          colorScheme: const ColorScheme.dark(
            primary: accentColor,
            secondary: accentColor,
          ),
          primaryColor: accentColor,
          primaryColorDark: accentColor,
          highlightColor: accentColor.withAlpha((0.1 * 255).round()),
          sliderTheme: base.sliderTheme.copyWith(
            thumbColor: accentColor,
            activeTrackColor: accentColor.withAlpha((0.7 * 255).round()),
            inactiveTrackColor: accentColor.withAlpha((0.12 * 255).round()),
            activeTickMarkColor: accentColor,
            inactiveTickMarkColor: accentColor,
            overlayColor: accentColor.withAlpha((0.12 * 255).round()),
          ),
        );
      case DevicePreviewToolBarThemeData.light:
        final base = ThemeData.light();
        const accentColor = Color.fromARGB(255, 143, 10, 180);
        const barColor = Color.fromARGB(255, 255, 255, 255);
        return base.copyWith(
          colorScheme: const ColorScheme.light(
            primary: accentColor,
            secondary: accentColor,
            surface: Colors.white
          ),
          
          canvasColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          splashColor: accentColor.withValues(alpha: .02),
          highlightColor: Colors.transparent,
          primaryColor: accentColor,
          primaryColorDark: accentColor,
          appBarTheme: base.appBarTheme.copyWith(
            color: barColor,
          ),
          sliderTheme: base.sliderTheme.copyWith(
            thumbColor: accentColor,
            activeTrackColor: accentColor.withAlpha((0.7 * 255).round()),
            inactiveTrackColor: accentColor.withAlpha((0.12 * 255).round()),
            activeTickMarkColor: accentColor,
            inactiveTickMarkColor: accentColor,
            overlayColor: accentColor.withAlpha((0.12 * 255).round()),
          ),
        );
    }
  }
}
