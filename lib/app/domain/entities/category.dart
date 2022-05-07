import 'package:flutter/material.dart';

class Category {
  Category({
    required this.id,
    required this.name,
    required this.color,
    required this.totalTasks,
    required this.totalDoneTasks,
  });

  int id;
  String name;
  Color color;
  int totalTasks;
  int totalDoneTasks;
}
