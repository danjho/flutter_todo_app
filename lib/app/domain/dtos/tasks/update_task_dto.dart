import 'package:todo_app/app/data/models/task_model.dart';

class UpdateTaskDto {
  UpdateTaskDto({
    required this.id,
    required this.title,
    required this.done,
    required this.date,
    required this.category,
  });

  factory UpdateTaskDto.fromModel(TaskModel model) {
    return UpdateTaskDto(
      id: model.id,
      title: model.title,
      done: model.done,
      date: model.date,
      category: model.category ?? 0,
    );
  }

  int id;
  String title;
  bool done;
  DateTime date;
  int category;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'done': done,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}
