import 'package:todo_app/modules/home/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String id,
    required String title,
    required bool done,
    required DateTime date,
  }) : super(id: id, title: title, done: done, date: date);

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      done: map['done'] ?? false,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'done': done,
      'date': date.millisecondsSinceEpoch,
    };
  }

  static List<TaskModel> fromList(List list) =>
      List<TaskModel>.from(list.map((x) => TaskModel.fromJson(x)));
}
