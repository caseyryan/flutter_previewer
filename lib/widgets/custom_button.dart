import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_color_theme.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_text_theme.dart';

import 'color_change_wrapper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.isEnabled = true,
    required this.text,
    this.isLoading = false,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.width,
    this.height,
    this.backgroundColor,
    this.icon,
    this.borderRadius = kBorderRadius,
  });

  final double borderRadius;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final String text;
  final bool isLoading;
  final bool isEnabled;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? CustomColorTheme.of(context).positiveColor;
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Container(
        constraints: BoxConstraints(
          minWidth: width ?? 0,
        ),
        height: height ?? kButtonHeight,
        width: width,
        child: MaterialButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
          focusElevation: 0.0,
          hoverElevation: 0.0,
          highlightElevation: 0.0,
          disabledElevation: 0.0,
          padding: EdgeInsets.zero,
          color: color,
          disabledColor: color.withValues(alpha: .5),
          onLongPress: onLongPress,
          onPressed: isLoading || isEnabled == false ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: kPadding,
                    ),
                    child: CupertinoActivityIndicator(
                      radius: 8.0,
                      animating: true,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                Row(
                  children: [
                    if (icon != null)
                      Padding(
                        padding: EdgeInsets.only(
                          right: text.isNotEmpty ? kPadding : 0.0,
                        ),
                        child: ColorChangeWrapper(
                          color: Theme.of(context).colorScheme.onPrimary,
                          child: icon!,
                        ),
                      ),
                    Text(
                      text,
                      style: CustomTextTheme.of(context).customButtonTextStyle.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
