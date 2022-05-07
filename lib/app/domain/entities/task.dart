import 'package:flutter/material.dart';

class Task {
  Task({
    required this.id,
    required this.title,
    required this.done,
    required this.date,
    required this.color,
    this.category,
  });

  int id;
  String title;
  bool done;
  DateTime date;
  Color color;
  int? category;
}
