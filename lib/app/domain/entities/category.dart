import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/color_ext.dart';

class Category {
  Category({
    this.id = '',
    this.name = '',
    this.color = Colors.grey,
    this.totalTasks = 0,
    this.totalDoneTasks = 0,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        color: ColorExt.fromHex(json['color']),
        totalTasks: json['totalTasks'],
        totalDoneTasks: json['totalDoneTasks'],
      );

  String id;
  String name;
  Color color;
  int totalTasks;
  int totalDoneTasks;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color.toHexColor(),
        'totalTasks': totalTasks,
        'totalDoneTasks': totalDoneTasks,
      };

  static List<Category> fromList(List list) {
    return List<Category>.from(list.map((x) => Category.fromJson(x)));
  }
}
