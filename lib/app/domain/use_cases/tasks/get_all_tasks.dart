import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/entities/task.dart' as app;
import 'package:todo_app/app/domain/interfaces/i_task_repository.dart';
import 'package:todo_app/core/errors/errors.dart';

class GetAllTasks {
  GetAllTasks(this.repo);

  final ITaskRepository repo;

  Future<Either<Failure, List<app.Task>>> call() async {
    try {
      return repo.getAll();
    } catch (e) {
      return Left(RepositoryError());
    }
  }
}
