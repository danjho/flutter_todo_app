import 'package:todo_app/modules/create_task/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/home/data/models/task_model.dart';
import 'package:todo_app/modules/home/domain/entities/task.dart';

abstract class ITaskDataSource {
  Future<List<TaskModel>> getAll();
  Future<Task> create(CreateTaskDto dto);
}
