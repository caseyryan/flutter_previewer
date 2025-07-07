import 'dart:convert';
import 'package:flutter/material.dart';

/// Если надо будет конвертнуть тему телеги в тему приложения
/// https://core.telegram.org/bots/webapps#themeparams
class NativeTelegramColorTheme {
  final Color bgColor;
  final Color textColor;
  final Color hintColor;
  final Color linkColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color secondaryBgColor;
  final Color headerBgColor;
  final Color bottomBarBgColor;
  final Color accentTextColor;
  final Color sectionBgColor;
  final Color sectionHeaderTextColor;
  final Color sectionSeparatorColor;
  final Color subtitleTextColor;
  final Color destructiveTextColor;

  NativeTelegramColorTheme({
    required this.bgColor,
    required this.textColor,
    required this.hintColor,
    required this.linkColor,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.secondaryBgColor,
    required this.headerBgColor,
    required this.bottomBarBgColor,
    required this.accentTextColor,
    required this.sectionBgColor,
    required this.sectionHeaderTextColor,
    required this.sectionSeparatorColor,
    required this.subtitleTextColor,
    required this.destructiveTextColor,
  });

  factory NativeTelegramColorTheme.fromJson(String jsonStr) {
    final Map<String, dynamic> json = jsonDecode(jsonStr);

    return NativeTelegramColorTheme(
      bgColor: _hexToColor(json['bg_color']),
      textColor: _hexToColor(json['text_color']),
      hintColor: _hexToColor(json['hint_color']),
      linkColor: _hexToColor(json['link_color']),
      buttonColor: _hexToColor(json['button_color']),
      buttonTextColor: _hexToColor(json['button_text_color']),
      secondaryBgColor: _hexToColor(json['secondary_bg_color']),
      headerBgColor: _hexToColor(json['header_bg_color']),
      bottomBarBgColor: _hexToColor(json['bottom_bar_bg_color']),
      accentTextColor: _hexToColor(json['accent_text_color']),
      sectionBgColor: _hexToColor(json['section_bg_color']),
      sectionHeaderTextColor: _hexToColor(json['section_header_text_color']),
      sectionSeparatorColor: _hexToColor(json['section_separator_color']),
      subtitleTextColor: _hexToColor(json['subtitle_text_color']),
      destructiveTextColor: _hexToColor(json['destructive_text_color']),
    );
  }

  static Color _hexToColor(String hex) {
    if (hex.isEmpty) {
      throw ArgumentError('Hex color cannot be empty');
    }
    // Убираем возможный префикс '#'
    hex = hex.replaceAll('#', '');
    return Color(int.parse(hex, radix: 16));
  }
}
