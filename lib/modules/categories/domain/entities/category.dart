import 'package:todo_app/modules/tasks/domain/entities/task.dart';

class Category {
  Category({
    this.id = '',
    this.name = '',
    this.color = '',
    this.tasks = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        color: json['color'],
        tasks: List<Task>.from(
          (json['tasks'] as List).map((x) => Task.fromJson(x)),
        ),
      );

  String id;
  String name;
  String color;
  List<Task> tasks;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'tasks': List<dynamic>.from(tasks.map((x) => x.toJson())),
      };

  static List<Category> fromList(List list) {
    return List<Category>.from(list.map((x) => Category.fromJson(x)));
  }
}
