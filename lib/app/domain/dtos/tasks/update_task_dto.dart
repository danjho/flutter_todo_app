import 'package:flutter/material.dart';

class UpdateTaskDto {
  UpdateTaskDto({
    required this.id,
    required this.category,
    this.title,
    this.color,
    this.done,
  });

  String id;
  String category;
  String? title;
  bool? done;
  DateTime? date;
  Color? color;
}
