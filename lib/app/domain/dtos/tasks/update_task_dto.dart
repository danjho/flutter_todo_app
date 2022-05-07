import 'package:flutter/material.dart';
import 'package:todo_app/app/domain/entities/task.dart';

class UpdateTaskDto extends Task {
  UpdateTaskDto({
    required this.category,
    String? id,
    String? title,
    bool? done,
    DateTime? date,
    Color? color,
  }) : super(
          id: id,
          color: color,
          date: date,
          done: done,
          title: title,
        );

  String category;
}
