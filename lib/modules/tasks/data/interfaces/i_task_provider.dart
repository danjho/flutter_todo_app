import 'package:todo_app/modules/tasks/data/models/task_model.dart';
import 'package:todo_app/modules/tasks/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';

abstract class ITaskProvider {
  Future<List<TaskModel>> getAll();
  Future<Task> create(CreateTaskDto dto);
}
