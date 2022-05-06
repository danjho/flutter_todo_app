import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart' as t;
import 'package:todo_app/app/domain/interfaces/i_task_repository.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';

class UpdateTask extends UseCase<t.Task, UpdateTaskDto> {
  UpdateTask(this.repo);

  final ITaskRepository repo;

  @override
  Future<Either<Failure, t.Task>> call(dto) async {
    try {
      return repo.update(dto);
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
