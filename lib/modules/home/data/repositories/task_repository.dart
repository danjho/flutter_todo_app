import 'package:todo_app/modules/create_task/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/home/data/data_sources/i_task_data_source.dart';
import 'package:todo_app/modules/home/domain/entities/task.dart' as app;
import 'package:todo_app/core/errors/errors.dart';

import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/home/domain/repositories/i_task_repository.dart';

class TaskRepository extends ITaskRepository {
  TaskRepository(this.dataSource);

  final ITaskDataSource dataSource;
  @override
  Future<Either<RepositoryError, List<app.Task>>> getAll() async {
    try {
      final tasks = await dataSource.getAll();
      return Right(tasks);
    } catch (e) {
      return Left(RepositoryError());
    }
  }

  @override
  Future<Either<RepositoryError, app.Task>> create(CreateTaskDto dto) {
    // TODO: implement create
    throw UnimplementedError();
  }
}
