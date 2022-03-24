import 'package:dartz/dartz.dart' as d;
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/empty_fild_validation.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';
import 'package:todo_app/modules/tasks/domain/interfaces/i_task_repository.dart';
import 'package:todo_app/modules/tasks/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/tasks/domain/errors/errors.dart';

class CreateTask extends UseCase<Task, CreateTaskDto> {
  CreateTask({required this.repo});

  final ITaskRepository repo;

  @override
  Future<d.Either<Failure, Task>> call(dto) async {
    try {
      _validateFields(dto);
    } on TaskInputError catch (e) {
      return d.Left(e);
    }

    return repo.create(dto);
  }

  void _validateFields(CreateTaskDto dto) {
    final validations = [
      EmptyFildValidation.validate('Título', dto.title),
      EmptyFildValidation.validate('Categoria', dto.category),
    ];

    for (final element in validations) {
      if (element != null) {
        throw TaskInputError(message: element);
      }
    }

    if (dto.date.isBefore(DateTime.now())) {
      throw TaskInputError(message: 'Data inválida');
    }
  }
}
