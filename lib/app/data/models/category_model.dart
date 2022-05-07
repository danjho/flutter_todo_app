import 'dart:ui';

import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/core/extensions/color_ext.dart';

class CategoryModel extends Category {
  CategoryModel({
    required int id,
    required String name,
    required Color color,
    int? totalTasks,
    int? totalDoneTasks,
  }) : super(
          id: id,
          name: name,
          color: color,
          totalTasks: totalTasks ?? 0,
          totalDoneTasks: totalDoneTasks ?? 0,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      color: ColorExt.fromHex(json['color']),
      totalTasks: json['totalTasks'],
      totalDoneTasks: json['totalDoneTasks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color.toHexColor(),
      'totalTasks': totalTasks,
      'totalDoneTasks': totalDoneTasks,
    };
  }

  static List<Category> fromList(List list) {
    return List<Category>.from(list.map((x) => CategoryModel.fromJson(x)));
  }
}
