import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/color_ext.dart';

class Task {
  Task({
    this.id,
    this.title,
    this.done,
    this.date,
    this.color,
    this.category,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'] ?? '',
      done: json['done'] ?? false,
      date: DateTime.tryParse(json['date'] ?? ''),
      color: ColorExt.fromHex(json['color']),
      category: json['category_id'],
    );
  }

  int? id;
  String? title;
  bool? done;
  DateTime? date;
  Color? color;
  int? category;

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'title': title,
        'done': done,
        'date': date?.toIso8601String(),
        // 'color': color?.toHexColor(),
        'category': category,
      };

  static List<Task> fromList(List list) {
    return List<Task>.from(list.map((e) => Task.fromJson(e)));
  }
}
