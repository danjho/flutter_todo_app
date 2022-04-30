import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.labelText,
    this.textInputType = TextInputType.text,
    this.borderRadius = 8,
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.validator,
    this.onChange,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final TextInputType textInputType;
  final double borderRadius;
  final String? hintText;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final String? Function(String? text)? validator;
  final Function(String text)? onChange;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Theme.of(context).cardColor,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
      ),
      textCapitalization: TextCapitalization.none,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChange,
      obscureText: obscureText,
    );
  }
}
