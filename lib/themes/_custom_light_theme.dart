part of 'themes.dart';

class CustomLightTheme {
  static const ColorScheme colorScheme = ColorScheme.light();
  static const TextStyle textStyle = TextStyle(
    color: Colors.black,
  );
  static ThemeData get theme => ThemeData(
        primarySwatch: MaterialColor(
          customPrimaryColor.toARGB32(),
          lightThemeColorShades,
        ),
        useMaterial3: useMaterial3,
        colorScheme: ColorScheme.light(
          primary: customPrimaryColor,
          secondary: customPrimaryColor.withValues(alpha: .1),
          onPrimary: Colors.white,
        ),
        primaryColor: customPrimaryColor,
        primaryColorLight: customPrimaryColor.withValues(alpha: .1),
        scaffoldBackgroundColor: const Color(0xfff9fafb),
        cardColor: Colors.white,
        highlightColor: Colors.transparent,
        splashColor: const Color.fromARGB(19, 0, 0, 0),
        hoverColor: Colors.transparent,
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          elevation: .1,
          color: Colors.white,
        ),
        canvasColor: const Color.fromARGB(255, 250, 250, 250),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: .1,
          scrolledUnderElevation: 1.0,
          titleTextStyle: TextStyle(
            color: Color(0xFF373737),
            fontSize: 18.0,
          ),
          iconTheme: IconThemeData(
            color: Color(0xFF373737),
          ),
        ),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: customPrimaryColor,
            ),
            bodyMedium: TextStyle(
              color: Color.fromARGB(255, 40, 40, 40),
            ),
            bodySmall: TextStyle(
              color: Color.fromARGB(255, 40, 40, 40),
            )),
        buttonTheme: ButtonThemeData(
          buttonColor: customPrimaryColor,
          textTheme: ButtonTextTheme.primary,
          colorScheme: const ColorScheme.light(
            primary: customPrimaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: customPrimaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: customPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: customPrimaryColor,
            side: const BorderSide(color: customPrimaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        extensions: [
          CustomColorTheme.light(),
          CustomTextTheme.light(),
        ],
      );
}
