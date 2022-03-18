import 'package:todo_app/modules/home/domain/entities/task.dart';

abstract class ITaskDataSource {
  Future<List<Task>> getAll();
}
