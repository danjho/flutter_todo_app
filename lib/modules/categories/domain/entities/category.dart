import 'package:todo_app/modules/tasks/domain/entities/task.dart';

class Category {
  Category({
    required this.id,
    required this.name,
    required this.color,
    required this.tasks,
  });

  String id;
  String name;
  String color;
  List<Task> tasks;
}
