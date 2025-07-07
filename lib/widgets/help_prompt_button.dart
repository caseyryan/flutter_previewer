import 'package:flutter/material.dart';
import 'package:flutter_previewer/constants.dart';

/// маленькая кнопка с вопросом, которая показывает алерт с подсказкой
class HelpPromptButton extends StatelessWidget {
  const HelpPromptButton({
    super.key,
    required this.text,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.underTextBuilder,
  });

  final String text;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final WidgetBuilder? underTextBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: SizedBox(
        width: kSmallButtonHeight,
        height: kSmallButtonHeight,
        child: IconButton(
          icon: Icon(
            Icons.help_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            // showCustomAdaptiveDialog(
            //   title: 'Подсказка'.translate(),
            //   text: text,
            //   cancelButtonText: 'Закрыть'.translate(),
            //   underTextWidget: underTextBuilder?.call(context),
            // );
          },
        ),
      ),
    );
  }
}
