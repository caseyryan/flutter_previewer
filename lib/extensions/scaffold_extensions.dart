import 'package:flutter/material.dart';

extension ScaffoldExtension on Scaffold {
  Widget removeInsets(
    BuildContext context, {
    bool removeTop = true,
    bool removeBottom = false,
  }) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: removeTop,
      removeBottom: removeBottom,
      child: this,
    );
  }
}
