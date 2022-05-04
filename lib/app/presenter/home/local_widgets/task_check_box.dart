import 'package:flutter/material.dart';

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    required this.value,
    this.size = 24,
    this.color,
    Key? key,
  }) : super(key: key);

  final bool value;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: value
            ? null
            : Border.all(
                color: color ?? Colors.red,
                width: 2,
              ),
        color: value ? Color(0xFFd3dcf9) : Colors.transparent,
      ),
      child: value
          ? Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: size / 1.5,
              ),
            )
          : SizedBox(),
    );
  }
}
