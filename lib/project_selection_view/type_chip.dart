import 'package:flutter/material.dart';
import 'package:flutter_previewer/models/project_model.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_color_theme.dart';
import 'package:flutter_previewer/themes/theme_extensions/custom_text_theme.dart';

class TypeChip extends StatelessWidget {
  const TypeChip({
    super.key,
    required this.type,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
  });

  final ProjectType type;
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
        decoration: BoxDecoration(
          color: CustomColorTheme.of(context).chipBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 3.0,
          ),
          child: Text(
            type.title,
            style: CustomTextTheme.of(context).chipStyle,
          ),
        ),
      ),
    );
  }
}
