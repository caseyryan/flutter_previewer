import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kNormalFontSize = 14.0;

double get bigTextSize => 21.0 * customFontScale;  // Slightly larger for main titles
double get normalTextSize => kNormalFontSize * customFontScale;  // Standard text size
double get tinyTextSize => 13.0 * customFontScale;  // For smaller text
double get mediumTextSize => 16.0 * customFontScale;  // For medium emphasis

double get customFontScale {
  return 1.0;  // You can adjust the scale here if needed for accessibility
}

@immutable
class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  const CustomTextTheme({
    required this.mainWordStyle,
    required this.chipStyle,
    required this.defaultStyle,
    required this.customButtonTextStyle,
    required this.captionStyle,
    required this.descriptionStyle,
    required this.headerStyle,
    this.marginStyle,
    this.italicStyle,
    this.exampleStyle,
    this.boldStyle,
    this.labelStyle,
    this.hintStyle,
    this.starStyle,
    this.coloredStyle,
  });

  final TextStyle customButtonTextStyle;
  final TextStyle descriptionStyle;
  final TextStyle captionStyle;
  final TextStyle headerStyle;
  final TextStyle mainWordStyle;
  final TextStyle chipStyle;
  final TextStyle defaultStyle;
  final TextStyle? marginStyle;
  final TextStyle? italicStyle;
  final TextStyle? exampleStyle;
  final TextStyle? boldStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? starStyle;
  final TextStyle? coloredStyle;

  // Dark theme version
  factory CustomTextTheme.dark() {
    return CustomTextTheme(
      mainWordStyle: GoogleFonts.roboto().copyWith(
        fontSize: bigTextSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      chipStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.white70,  // A lighter color for transcription
      ),
      captionStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: tinyTextSize,
        color: const Color.fromARGB(255, 212, 212, 212), 
      ),
      descriptionStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.white,
      ),
      headerStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: mediumTextSize,
        fontWeight: FontWeight.w600,
        color: const Color(0xffd5d9e2),
      ),
      customButtonTextStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: mediumTextSize,
        color: Colors.white,
      ),
      defaultStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.white,
      ),
      marginStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.white,
      ),
      exampleStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.white70,  // Slightly lighter color for examples
      ),
      starStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: const Color(0xFF4FC3F7),  // Telegram blue color for stars
        fontSize: normalTextSize,
      ),
      italicStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontStyle: FontStyle.italic,
        fontSize: normalTextSize,
        color: Colors.white70,  // Lighter color for italic text
      ),
      labelStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: const Color.fromARGB(255, 98, 105, 119),  
        fontSize: normalTextSize,
        height: 1.1,
      ),
      hintStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: Colors.grey[500],  // Slightly darker grey for references
        fontSize: mediumTextSize,
      ),
      boldStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontWeight: FontWeight.bold,
        fontSize: normalTextSize,
        color: Colors.white,
      ),
      coloredStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: const Color(0xFF33B7E7),  // Telegram brand color for highlights
        fontSize: normalTextSize,
      ),
    );
  }

  // Light theme version
  factory CustomTextTheme.light() {
    return CustomTextTheme(
      mainWordStyle: GoogleFonts.roboto().copyWith(
        fontSize: bigTextSize,
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(255, 65, 66, 68),
      ),
      chipStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.white,  // Lighter color for transcription
      ),
      captionStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: tinyTextSize,
        color: const Color.fromARGB(255, 98, 98, 98),  
      ),
      descriptionStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: const Color.fromARGB(221, 68, 68, 68),
      ),
      headerStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: mediumTextSize,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      customButtonTextStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: mediumTextSize,
        color: Colors.black87,
      ),
      defaultStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.black87,
      ),
      marginStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.black87,
      ),
      exampleStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontSize: normalTextSize,
        color: Colors.black54,  // Slightly lighter color for examples
      ),
      starStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: const Color(0xFF33B7E7), 
        fontSize: normalTextSize,
      ),
      italicStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontStyle: FontStyle.italic,
        fontSize: normalTextSize,
        color: Colors.black54,  // Lighter color for italic text
      ),
      labelStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: Colors.grey[600],  // Slightly darker grey for labels
        fontSize: normalTextSize,
        height: 1.1,
      ),
      hintStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: Colors.grey[500], 
        fontSize: mediumTextSize,
      ),
      boldStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        fontWeight: FontWeight.bold,
        fontSize: normalTextSize,
        color: Colors.black87,
      ),
      coloredStyle: GoogleFonts.roboto().copyWith(
        inherit: true,
        color: const Color(0xFF33B7E7),  // Telegram brand color for highlights
        fontSize: normalTextSize,
      ),
    );
  }

  @override
  ThemeExtension<CustomTextTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<CustomTextTheme> lerp(
    covariant ThemeExtension<CustomTextTheme>? other,
    double t,
  ) {
    return this;
  }

  static CustomTextTheme of(BuildContext context) {
    return Theme.of(context).extension<CustomTextTheme>()!;
  }
}
