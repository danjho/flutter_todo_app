import 'package:flutter/material.dart';

class Position {
  Position._();

  static RelativeRect getWidgetPosition(GlobalKey key) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    //*calculate the start point in this case, below the button
    final left = offset.dx;
    final top = offset.dy + renderBox.size.height;
    //*The right does not indicates the width
    final right = left + renderBox.size.width;

    return RelativeRect.fromLTRB(left, top, right, 0.0);
  }
}
