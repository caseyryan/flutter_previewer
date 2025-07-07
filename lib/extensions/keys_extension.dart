import 'package:flutter/widgets.dart';

extension GlobalKeyExtension on GlobalKey {
  Offset? globalToLocal(Offset globalOffset) {
    final renderObject = currentContext?.findRenderObject() as RenderBox?;
    if (renderObject != null) {
      final localOffset = renderObject.globalToLocal(globalOffset);
      return localOffset;
    }
    return null;
  }

  bool isGlobalPositionInside({
    required Offset globalPosition, 
    bool checkOnlyVertical = true,
  }) {
    final localPosition = globalToLocal(globalPosition);
    if (localPosition == null) {
      return false;
    }
    final size = currentContext?.size;
    if (size == null) {
      return false;
    }
    if (checkOnlyVertical) {
      return localPosition.dy > 0 &&
          localPosition.dy < size.height;
    }
    return localPosition.dx >= 0 &&
        localPosition.dy >= 0 &&
        localPosition.dx <= size.width &&
        localPosition.dy <= size.height;
  }
}
