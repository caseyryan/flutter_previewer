import 'package:flutter_previewer/constants.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_text_theme.dart';
import 'package:flutter_previewer/widgets/help_prompt_button.dart';
import 'package:flutter/material.dart';

/// A header is simple text already styled as a header.
/// Use it where ever you need a 20pt/24pt bold text with Label/Primary color
class Header extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final bool isBigHeader;
  final Color? textColor;
  final bool isSliver;
  final double? width;
  final TextStyle? style;
  final String? hintText;

  /// [isBigHeader] will use a header style with 24pt font size
  const Header({
    required this.text,
    this.textAlign,
    this.hintText,
    this.style,
    this.isBigHeader = false,
    this.isSliver = false,
    this.paddingTop = kPadding,
    this.paddingBottom = kPadding,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.textColor,
    this.width,
    super.key,
  });

  TextStyle getStyle(BuildContext context) {
    if (style != null) {
      return style!;
    }
    final theme = CustomTextTheme.of(context);
    if (isBigHeader) {
      return theme.mainWordStyle.copyWith(
        color: textColor,
      );
    }
    return theme.headerStyle.copyWith(
      color: textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.only(
          top: paddingTop,
          bottom: paddingBottom,
          left: paddingLeft,
          right: paddingRight,
        ),
        child: hintText == null
            ? Text(
                text ?? '',
                style: getStyle(context),
                textAlign: textAlign,
              )
            : Row(
                children: [
                  Expanded(
                    child: Text(
                      text ?? '',
                      style: getStyle(context),
                      textAlign: textAlign,
                    ),
                  ),
                  const SizedBox(
                    width: kSmallPadding,
                  ),
                  HelpPromptButton(
                    text: hintText ?? '',
                  ),
                ],
              ),
      ),
    );
    if (isSliver) {
      return SliverToBoxAdapter(
        child: child,
      );
    }
    return child;
  }
}
