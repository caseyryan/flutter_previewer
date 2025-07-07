import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  Future scrollToEnd() async {
    if (hasClients == true) {
      animateTo(
        position.maxScrollExtent,
        duration: kThemeAnimationDuration,
        curve: Curves.linear,
      );
    }
  }
  /// [topPadding] offset from the screen top
  Future scrollToGlobalKey({
    required GlobalKey key,
    double topPadding = 150.0,
    double bottomPadding = 150.0,
  }) async {
    if (key.currentContext != null) {
      final size = MediaQuery.sizeOf(key.currentContext!);
      final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
      final position = renderBox?.getTransformTo(null).getTranslation();
      final maxExtent = this.position.maxScrollExtent;
      if (position != null) {
        final top = position.y + topPadding;
        final bottom = (renderBox!.size.height + position.y) + bottomPadding;
        double scrollDistance = 0.0;
        // debugPrint('BOTTOM: $bottom');
        // debugPrint('TOP: $top, POSITION: ${this.position.pixels}');
        final realTopPos = top;
        final realBottomPos = bottom - size.height;
        if (realTopPos < 0.0) {
          scrollDistance = realTopPos;
        } else if (realBottomPos > 0.0) {
          scrollDistance = realBottomPos;
        }
        final scrollTo = (this.position.pixels + scrollDistance).clamp(0.0, maxExtent);
        // print(scrollTo);
        await animateTo(
          scrollTo,
          duration: Duration(milliseconds: scrollTo.toInt().clamp(100, 500)),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}
