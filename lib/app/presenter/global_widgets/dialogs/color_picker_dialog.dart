import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';

class ColorPickerDialog {
  ColorPickerDialog._();

  static const double _size = 44;

  static void show(
    BuildContext context, {
    required Function(Color color) onSelected,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(DEFAULT_PADDING),
                    ),
                    child: ColorPicker(
                      width: _size,
                      height: _size,
                      borderRadius: _size / 2,
                      color: Colors.transparent,
                      enableShadesSelection: false,
                      pickersEnabled: <ColorPickerType, bool>{
                        ColorPickerType.accent: true,
                        ColorPickerType.primary: false,
                      },
                      onColorChanged: (color) {
                        onSelected(color);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
