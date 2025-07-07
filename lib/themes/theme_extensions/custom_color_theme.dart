import 'package:flutter/material.dart';

@immutable
class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  const CustomColorTheme({
    required this.bottomBarColor,
    required this.circleButtonHighlight,
    required this.circleButtonIconColor,
    required this.actionSheetColor,
    required this.paleBackgroundColor,
    required this.positiveColor,
    required this.negativeColor,
    required this.deletedPostColor,
    required this.warningColor,
    required this.normalTextColor,
    required this.paleButtonHighlightColor,
    required this.labelColor,
    required this.highlightGradient,
    required this.chipTextColor,
    required this.chipBackgroundColor,
    required this.centerBottomBarButtonBackgroundColor,
    required this.selectionColor,
    required this.leftHandleColor,
    required this.rightHandleColor,
    required this.articleHighlightColor,
  });

  final Color bottomBarColor;
  final Color chipTextColor;
  final Color centerBottomBarButtonBackgroundColor;
  final Color chipBackgroundColor;
  final Color circleButtonHighlight;
  final Color labelColor;
  final Color circleButtonIconColor;
  final Color normalTextColor;
  final Color paleButtonHighlightColor;
  final Color actionSheetColor;
  final Color paleBackgroundColor;
  final Color positiveColor;
  final Color negativeColor;
  final Color deletedPostColor;
  final Color warningColor;
  final Color selectionColor;

  /// цвет статей, который куда-то запланированы
  final Color articleHighlightColor;
  final Color leftHandleColor;
  final Color rightHandleColor;

  final LinearGradient highlightGradient; // New gradient property

  factory CustomColorTheme.dark() {
    return CustomColorTheme(
      bottomBarColor: const Color(0xff14171a).withValues(alpha: .9),
      chipBackgroundColor: const Color(0xff61b2f8),
      articleHighlightColor: const Color.fromARGB(255, 67, 81, 101),
      chipTextColor: const Color.fromARGB(255, 255, 255, 255),
      centerBottomBarButtonBackgroundColor: const Color.fromARGB(255, 14, 77, 173),
      circleButtonHighlight: const Color(0xff61b2f8),
      selectionColor: const Color.fromARGB(255, 51, 96, 167),
      leftHandleColor: const Color.fromARGB(255, 98, 150, 234),
      rightHandleColor: const Color.fromARGB(255, 59, 191, 248),
      circleButtonIconColor: const Color.fromARGB(255, 248, 248, 248),
      actionSheetColor: const Color.fromARGB(255, 32, 38, 47),
      paleBackgroundColor: const Color.fromARGB(255, 43, 61, 80),
      positiveColor: const Color(0xff12b981),
      negativeColor: const Color.fromARGB(255, 255, 118, 118),
      deletedPostColor: const Color.fromARGB(255, 71, 13, 13),
      warningColor: const Color.fromARGB(255, 255, 179, 72),
      paleButtonHighlightColor: const Color.fromARGB(255, 64, 91, 121),
      normalTextColor: const Color.fromARGB(255, 243, 243, 243),
      labelColor: const Color.fromARGB(255, 87, 87, 87),
      highlightGradient: const LinearGradient(
        colors: [
          Color(0xff4a9afb),
          Color(0xff2946df),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  factory CustomColorTheme.light() {
    return const CustomColorTheme(
      chipBackgroundColor:  Color(0xff61b2f8),
      chipTextColor: Color.fromARGB(255, 255, 255, 255),
      articleHighlightColor: Color.fromARGB(255, 234, 242, 255),
      centerBottomBarButtonBackgroundColor: Color.fromARGB(255, 0, 48, 124),
      bottomBarColor: Color.fromARGB(255, 252, 253, 255),
      circleButtonHighlight: Color(0xff388ef5),
      circleButtonIconColor: Colors.white,
      actionSheetColor: Color.fromARGB(255, 252, 252, 252),
      paleBackgroundColor: Color(0xfff3f4f6),
      positiveColor: Color.fromARGB(255, 32, 187, 37),
      // selectionColor: Color.fromARGB(255, 201, 223, 255),
      selectionColor: Color.fromARGB(255, 215, 235, 255),
      leftHandleColor: Color(0xFF3b82f6),
      rightHandleColor: Color.fromARGB(255, 35, 133, 178),
      negativeColor: Color(0xffff5853),
      deletedPostColor: Color.fromARGB(255, 255, 220, 218),
      warningColor: Colors.orange,
      paleButtonHighlightColor: Color.fromARGB(255, 240, 245, 255),
      normalTextColor: Color(0xFF373737),
      labelColor: Color.fromARGB(255, 239, 239, 239),
      highlightGradient: LinearGradient(
        colors: [
          Color(0xff388ef5),
          Color(0xff3658f1), // Bottom center
        ],
        // begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  @override
  CustomColorTheme copyWith() {
    return CustomColorTheme(
      bottomBarColor: bottomBarColor,
      articleHighlightColor: articleHighlightColor,
      selectionColor: selectionColor,
      leftHandleColor: leftHandleColor,
      rightHandleColor: rightHandleColor,
      chipBackgroundColor: chipBackgroundColor,
      chipTextColor: chipTextColor,
      centerBottomBarButtonBackgroundColor: centerBottomBarButtonBackgroundColor,
      circleButtonHighlight: circleButtonHighlight,
      circleButtonIconColor: circleButtonIconColor,
      actionSheetColor: actionSheetColor,
      paleBackgroundColor: paleBackgroundColor,
      positiveColor: positiveColor,
      negativeColor: negativeColor,
      deletedPostColor: deletedPostColor,
      warningColor: warningColor,
      paleButtonHighlightColor: paleButtonHighlightColor,
      normalTextColor: normalTextColor,
      labelColor: labelColor,
      highlightGradient: highlightGradient, // Ensure the gradient is copied
    );
  }

  @override
  CustomColorTheme lerp(
    ThemeExtension<CustomColorTheme>? other,
    double t,
  ) {
    if (other is! CustomColorTheme) {
      return this;
    }

    return CustomColorTheme(
      circleButtonHighlight: Color.lerp(
        circleButtonHighlight,
        other.circleButtonHighlight,
        t,
      )!,
      articleHighlightColor: Color.lerp(
        articleHighlightColor,
        other.articleHighlightColor,
        t,
      )!,
      selectionColor: Color.lerp(
        selectionColor,
        other.selectionColor,
        t,
      )!,
      leftHandleColor: Color.lerp(
        leftHandleColor,
        other.leftHandleColor,
        t,
      )!,
      rightHandleColor: Color.lerp(
        rightHandleColor,
        other.rightHandleColor,
        t,
      )!,
      chipTextColor: Color.lerp(
        chipTextColor,
        other.chipTextColor,
        t,
      )!,
      centerBottomBarButtonBackgroundColor: Color.lerp(
        centerBottomBarButtonBackgroundColor,
        other.centerBottomBarButtonBackgroundColor,
        t,
      )!,
      chipBackgroundColor: Color.lerp(
        chipBackgroundColor,
        other.chipBackgroundColor,
        t,
      )!,
      bottomBarColor: Color.lerp(
        bottomBarColor,
        other.bottomBarColor,
        t,
      )!,
      circleButtonIconColor: Color.lerp(
        circleButtonIconColor,
        other.circleButtonIconColor,
        t,
      )!,
      actionSheetColor: Color.lerp(
        actionSheetColor,
        other.actionSheetColor,
        t,
      )!,
      positiveColor: Color.lerp(
        positiveColor,
        other.positiveColor,
        t,
      )!,
      negativeColor: Color.lerp(
        negativeColor,
        other.negativeColor,
        t,
      )!,
      deletedPostColor: Color.lerp(
        deletedPostColor,
        other.deletedPostColor,
        t,
      )!,
      warningColor: Color.lerp(
        warningColor,
        other.warningColor,
        t,
      )!,
      paleButtonHighlightColor: Color.lerp(
        paleButtonHighlightColor,
        other.paleButtonHighlightColor,
        t,
      )!,
      normalTextColor: Color.lerp(
        normalTextColor,
        other.normalTextColor,
        t,
      )!,
      labelColor: Color.lerp(
        labelColor,
        other.labelColor,
        t,
      )!,
      paleBackgroundColor: Color.lerp(
        paleBackgroundColor,
        other.paleBackgroundColor,
        t,
      )!,
      highlightGradient: other.highlightGradient, // Lerp for the gradient if necessary
    );
  }

  static CustomColorTheme of(BuildContext context) {
    return Theme.of(context).extension<CustomColorTheme>()!;
  }
}
