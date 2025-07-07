import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';

import 'global_skeleton.dart';

/// A base for any material card which has paddings, margins for content and
/// a skeleton to display loading.
/// The card looks like a white rectangle with rounded corners
class CardBase extends StatelessWidget {
  final Widget child;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final double? borderWidth;
  final bool isSliver;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final bool isHidden;
  final bool isEnabled;
  final double borderRadius;
  final VoidCallback? onAnimationEnd;

  const CardBase({
    super.key,
    required this.child,
    this.onPressed,
    this.onAnimationEnd,
    this.backgroundColor,
    this.isLoading = false,
    this.isEnabled = true,
    this.borderWidth,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.marginTop = kPadding,
    this.marginBottom = kPadding,
    this.marginLeft = kPadding,
    this.marginRight = kPadding,
    this.isSliver = false,
    this.isHidden = false,
    this.borderColor,
    this.borderRadius = kCardBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final widget = AnimatedSize(
      onEnd: onAnimationEnd,
      alignment: Alignment.topCenter,
      duration: kThemeAnimationDuration,
      child: SizedBox(
        height: isHidden ? 0.0 : null,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              top: paddingTop,
              bottom: paddingBottom,
              left: paddingLeft,
              right: paddingRight,
            ),
            child: GlobalSkeleton(
              borderRadius: borderRadius,
              isEnabled: isLoading,
              child: AnimatedOpacity(
                opacity: isEnabled ? 1.0 : 0.7,
                duration: kThemeAnimationDuration,
                child: IgnorePointer(
                  ignoring: !isEnabled,
                  child: Opacity(
                    opacity: isLoading ? 0.0 : 1.0,
                    child: Card(
                      color: backgroundColor ?? Theme.of(context).cardColor,
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.all(
                          SmoothRadius(
                            cornerRadius: borderRadius,
                            cornerSmoothing: 1.0,
                          ),
                        ),
                        // side: BorderSide()
                        side: BorderSide(
                          width: kTileBorderWidth,
                          color: Theme.of(context).shadowColor,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                          borderRadius,
                        ),
                        splashColor: Colors.black.withValues(alpha: .005),
                        hoverColor: Colors.black.withValues(alpha: .005),
                        highlightColor: Colors.black.withValues(alpha: .005),
                        onTap: isEnabled ? onPressed : null,
                        child: Opacity(
                          opacity: isLoading ? 0.0 : 1.0,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: marginTop,
                              bottom: marginBottom,
                              left: marginLeft,
                              right: marginRight,
                            ),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    if (isSliver) {
      return SliverToBoxAdapter(
        child: widget,
      );
    }
    return widget;
  }
}
