import 'package:flutter/material.dart';

class UpdateTaskDto {
  UpdateTaskDto({
    required this.id,
    this.title,
    this.color,
    this.done,
  });
  
  String id;
  String? title;
  bool? done;
  DateTime? date;
  Color? color;
}
