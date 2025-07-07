import 'package:flutter/material.dart';

class ColorChangeWrapper extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ColorChangeWrapper({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (color == null) {
      return child;
    }
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color!,
        BlendMode.srcIn,
      ),
      child: child,
    );
  }
}