import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_color_theme.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_text_theme.dart';

import 'color_change_wrapper.dart';

class CustomPaleButton extends StatelessWidget {
  const CustomPaleButton({
    super.key,
    required this.onPressed,
    this.onLongPressed,
    this.isEnabled = true,
    required this.text,
    this.isLoading = false,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.width,
    this.height,
    this.isHighlighted = false,
    this.swapIconAndText = false,
    this.icon,
    this.horizontalMargin = 12.0,
    this.tooltip,
    this.underlineColor,
  });

  final String? tooltip;
  final Widget? icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final String text;
  final bool isLoading;
  final bool isEnabled;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double horizontalMargin;
  final double? width;
  final double? height;
  final bool isHighlighted;
  final bool swapIconAndText;
  final Color? underlineColor;

  @override
  Widget build(BuildContext context) {
    var bgColor = CustomColorTheme.of(context).paleBackgroundColor;
    if (isHighlighted) {
      bgColor = CustomColorTheme.of(context).paleButtonHighlightColor;
    }
    bool showOnlyLoader = isLoading && text.isEmpty;
    final child = Stack(
      children: [
        SizedBox(
          width: width,
          height: height ?? kButtonHeight,
          child: MaterialButton(
            elevation: 0.0,
            focusElevation: 0.0,
            hoverElevation: 0.0,
            highlightElevation: 0.0,
            disabledElevation: 0.0,
            padding: EdgeInsets.zero,
            color: bgColor,
            disabledColor: bgColor.withValues(alpha: .5),
            onLongPress: onLongPressed,
            onPressed: isLoading || isEnabled == false ? null : onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalMargin,
              ),
              child: showOnlyLoader
                  ? CupertinoActivityIndicator(
                      radius: 8.0,
                      animating: true,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    )
                  : Row(
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
                              color: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.color,
                            ),
                          ),
                        if (icon != null && !swapIconAndText)
                          Padding(
                            padding: EdgeInsets.only(
                              right: text.isNotEmpty ? kPadding : 0.0,
                            ),
                            child: ColorChangeWrapper(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withValues(
                                    alpha: isEnabled ? 1.0 : 0.3,
                                  ),
                              child: icon!,
                            ),
                          ),
                        Flexible(
                          child: Text(
                            text,
                            maxLines: 1,
                            style: CustomTextTheme.of(context)
                                .customButtonTextStyle
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color
                                      ?.withValues(
                                        alpha: isEnabled ? 1.0 : 0.3,
                                      ),
                                  fontWeight: isHighlighted
                                      ? FontWeight.bold
                                      : null,
                                ),
                          ),
                        ),
                        if (icon != null && swapIconAndText)
                          Padding(
                            padding: EdgeInsets.only(
                              left: text.isNotEmpty ? kPadding : 0.0,
                            ),
                            child: ColorChangeWrapper(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withValues(
                                    alpha: isEnabled ? 1.0 : 0.3,
                                  ),
                              child: icon!,
                            ),
                          ),
                      ],
                    ),
            ),
          ),
        ),
        if (underlineColor != null)
          Positioned(
            bottom: kSmallPadding,
            left: kBorderRadius,
            right: kBorderRadius,
            child: Container(
              height: 2.0,
              decoration: BoxDecoration(
                color: underlineColor!,
                borderRadius: const BorderRadius.all(
                  Radius.circular(kBorderRadius),
                ),
              ),
            ),
          ),
      ],
    );
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: tooltip?.isNotEmpty == true
          ? Tooltip(
              message: tooltip!,
              child: child,
            )
          : child,
    );
  }
}
