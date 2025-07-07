import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// конвертирует цвет в hex строку типа этой #3BB4FF
  String toSimpleHex({
    bool withAlphaChannel = false,
  }) {
    int colorValue = toARGB32();
    // int colorValue = value;

    if (!withAlphaChannel) {
      colorValue = colorValue & 0xFFFFFF; 
    }
    int padLeft = withAlphaChannel ? 8 : 6;
    String hex = '#${colorValue.toRadixString(16).padLeft(padLeft, '0').toUpperCase()}';
    return hex;
  }
}
