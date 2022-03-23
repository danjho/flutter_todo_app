import 'package:todo_app/modules/home/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String id,
    required String title,
    required bool done,
    required DateTime date,
  }) : super(id: id, title: title, done: done, date: date);

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    print('');
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      done: map['done'] ?? false,
      date: DateTime.parse(map['date']),
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

  static List<TaskModel> fromList(List list) {
    return List<TaskModel>.from(list.map((e) => TaskModel.fromJson(e)));
  }
}
