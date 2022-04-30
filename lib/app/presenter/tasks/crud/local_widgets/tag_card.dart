import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';

class TagCard extends StatelessWidget {
  const TagCard({
    required this.child,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(DEFAULT_PADDING),
      child: Container(
          height: 32,
          padding: EdgeInsets.all(DEFAULT_PADDING / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DEFAULT_PADDING),
              border: Border.all(
                color: Theme.of(context).backgroundColor,
              )),
          child: child),
    );
  }
}
