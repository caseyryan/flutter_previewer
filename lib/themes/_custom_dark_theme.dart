part of 'themes.dart';

class CustomDarkTheme {
  static const ColorScheme colorScheme = ColorScheme.dark();
  static const TextStyle textStyle = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static ThemeData? _themeData;

  static ThemeData get theme {
    const scaffoldColor = Color.fromARGB(255, 23, 34, 46);
    const primaryColor = Color.fromARGB(255, 98, 150, 234);
    if (!kDebugMode) {
      if (_themeData != null) {
        return _themeData!;
      }
    }
    _themeData = ThemeData(
      primarySwatch: MaterialColor(
        primaryColor.toARGB32(),
        darkThemeColorShades,
      ),
      useMaterial3: useMaterial3,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: primaryColor.withValues(alpha: .1),
        onPrimary: const Color.fromARGB(255, 244, 244, 244),
      ),
      primaryColor: primaryColor,
      primaryColorLight: primaryColor.withValues(alpha: .1),
      scaffoldBackgroundColor: scaffoldColor,
      cardColor: const Color.fromARGB(255, 30, 43, 56),
      highlightColor: Colors.transparent,
      splashColor: const Color.fromARGB(255, 79, 86, 100),
      hoverColor: const Color.fromARGB(0, 115, 71, 71),
      dialogTheme: DialogThemeData(
        backgroundColor: const Color.fromARGB(255, 43, 61, 80),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        elevation: .2,
      ),
      canvasColor: const Color.fromARGB(255, 21, 27, 37),
      appBarTheme: const AppBarTheme(
        backgroundColor: scaffoldColor,
        elevation: .2,
        scrolledUnderElevation: 1.0,
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18.0,
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: primaryColor,
        ),
        bodyMedium: TextStyle(
          color: Color.fromARGB(255, 253, 253, 253),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      extensions: [
        CustomColorTheme.dark(),
        CustomTextTheme.dark(),
      ],
    );
    return _themeData!;
  }
}
