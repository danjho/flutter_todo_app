import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart';

abstract class ITaskProvider {
  Future<List<Task>> getAll();

  Future<Task> create(CreateTaskDto dto);

  Future<Task> update(UpdateTaskDto dto);
}
