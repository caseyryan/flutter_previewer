import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_previewer/localization/translator_builder.dart';

class BackToProjectList extends StatelessWidget {
  const BackToProjectList({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ToolPanelSection(
      title: 'Главная'.translate(),
      children: [
        ListTile(
          key: const Key('back-to-projects'),
          title: Text(
            'Назад к Списку Проектов'.translate(),
          ),
          trailing: Icon(
            Icons.list,
          ),
          onTap: onPressed,
        ),
      ],
    );
  }
}
