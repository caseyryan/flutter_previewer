import 'dart:async';

import 'package:flutter/material.dart';

class ResizeDetector extends StatefulWidget {
  const ResizeDetector({
    super.key,
    required this.child,
    this.onSizeUpdate,
  });

  final ValueChanged<Size>? onSizeUpdate;
  final Widget child;

  @override
  State<ResizeDetector> createState() => _ResizeDetectorState();
}

class _ResizeDetectorState extends State<ResizeDetector> {
  Timer? _sizeTimer;
  final GlobalKey _key = GlobalKey();
  Size? _size;

  @override
  void initState() {
    if (widget.onSizeUpdate != null) {
      _sizeTimer = Timer.periodic(
        const Duration(milliseconds: 16),
        _onTimer,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _sizeTimer?.cancel();
    super.dispose();
  }

  void _onTimer(timer) {
    if (_key.currentContext != null) {
      final renderBox = context.findRenderObject() as RenderBox?;
      if (_size != renderBox!.size) {
        _size = renderBox.size;
        widget.onSizeUpdate!(_size!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onSizeUpdate == null) {
      return widget.child;
    }
    return SizedBox(
      key: _key,
      child: widget.child,
    );
  }
}
