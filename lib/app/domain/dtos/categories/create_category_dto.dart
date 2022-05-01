import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/color_ext.dart';

class CreateCategoryDto {
  CreateCategoryDto({
    required this.name,
    required this.color,
  });

  factory CreateCategoryDto.empty() {
    return CreateCategoryDto(name: '', color: Colors.grey);
  }

  String name;
  Color color;

  Map<String, dynamic> toJson() {
    return {'name': name, 'color': color.toHexColor()};
  }
}
