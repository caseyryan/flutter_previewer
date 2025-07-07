import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    this.height = 0.6,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
  });
  final double height;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Container(
        width: double.infinity,
        height: height,
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
