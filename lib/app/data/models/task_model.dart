import 'dart:ui';

import 'package:todo_app/app/domain/entities/task.dart';
import 'package:todo_app/core/extensions/color_ext.dart';

class TaskModel extends Task {
  TaskModel({
    required int id,
    required String title,
    required bool done,
    required DateTime date,
    required Color color,
    int? category,
  }) : super(
          id: id,
          title: title,
          done: done,
          date: date,
          color: color,
          category: category,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      done: json['done'],
      date: DateTime.parse(json['date']),
      color: ColorExt.fromHex(json['color']),
      category: int.tryParse(json['category_id']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'done': done,
      'date': date.toIso8601String(),
      'color': color.toHexColor(),
      'category': category,
    };
  }

  static List<Task> fromList(List list) {
    return List<Task>.from(list.map((e) => TaskModel.fromJson(e)));
  }
}
