import 'package:todo_app/modules/home/data/models/task_model.dart';

abstract class ITaskDataSource {
  Future<List<TaskModel>> getAll();
}
