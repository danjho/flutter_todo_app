import 'package:dartz/dartz.dart' as d;
import 'package:todo_app/modules/tasks/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart' as app;

import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';

abstract class ITaskRepository {
  Future<d.Either<RepositoryError, Task>> create(CreateTaskDto dto);
  Future<d.Either<RepositoryError, List<app.Task>>> getAll();
}
