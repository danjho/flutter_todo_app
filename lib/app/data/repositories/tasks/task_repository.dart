import 'package:dartz/dartz.dart' as d;
import 'package:todo_app/app/data/interfaces/tasks/i_task_provider.dart';
import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart';
import 'package:todo_app/app/domain/interfaces/i_task_repository.dart';
import 'package:todo_app/core/errors/errors.dart';

class TaskRepository extends ITaskRepository {
  TaskRepository(this.taskProvider);

  final ITaskProvider taskProvider;

  @override
  Future<d.Either<RepositoryError, List<Task>>> getAll() async {
    try {
      final tasks = await taskProvider.getAll();
      return d.Right(tasks);
    } catch (e) {
      return d.Left(RepositoryError());
    }
  }

  @override
  Future<d.Either<RepositoryError, Task>> create(CreateTaskDto dto) async {
    try {
      final task = await taskProvider.create(dto);
      return d.Right(task);
    } catch (e) {
      return d.Left(RepositoryError());
    }
  }

  @override
  Future<d.Either<Failure, Task>> update(UpdateTaskDto dto) async {
    try {
      final task = await taskProvider.update(dto);
      return d.Right(task);
    } on DatasourceError catch (e) {
      return d.Left(e);
    } catch (e) {
      return d.Left(UnexpectedError());
    }
  }
}
