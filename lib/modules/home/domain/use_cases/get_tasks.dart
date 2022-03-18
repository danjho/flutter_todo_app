import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/home/domain/entities/task.dart' as app;
import 'package:todo_app/modules/home/domain/repositories/i_task_repository.dart';

class GetTasks {
  GetTasks(this.repo);

  final ITaskRepository repo;

  Future<Either<Failure, List<app.Task>>> call() async {
    try {
      return repo.getAll();
    } catch (e) {
      return Left(RepositoryError());
    }
  }
}
