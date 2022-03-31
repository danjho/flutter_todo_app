import 'package:todo_app/modules/categories/domain/entities/category.dart';
import 'package:todo_app/modules/tasks/data/models/task_model.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String id,
    required String name,
    required String color,
    required List<TaskModel> tasks,
  }) : super(id: id, name: name, color: color, tasks: tasks);

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      color: map['color'] ?? '',
      tasks: List<TaskModel>.from(map['tasks'].map(
        (x) => TaskModel.fromJson(x),
      )),
    );
  }

  static List<CategoryModel> fromList(List list) {
    return List<CategoryModel>.from(list.map((x) => CategoryModel.fromJson(x)));
  }
}
