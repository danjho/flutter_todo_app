import 'package:todo_app/modules/tasks/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';

abstract class ITaskProvider {
  Future<List<Task>> getAll();
  Future<Task> create(CreateTaskDto dto);
}
