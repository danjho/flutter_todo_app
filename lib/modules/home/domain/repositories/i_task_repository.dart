import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/home/domain/entities/task.dart' as app;

import 'package:todo_app/core/errors/errors.dart';

abstract class ITaskRepository {
  Future<Either<RepositoryError, List<app.Task>>> getAll();
}
