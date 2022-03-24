import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart' as app;
import 'package:todo_app/modules/tasks/domain/interfaces/i_task_repository.dart';
import 'package:todo_app/modules/tasks/domain/use_cases/get_all_tasks.dart';

import 'get_tasks_test.mocks.dart';

@GenerateMocks([ITaskRepository])
void main() {
  final repo = MockITaskRepository();
  final useCase = GetAllTasks(repo);
  test('Deve retornar as tarefas', () async {
    when(repo.getAll()).thenAnswer((_) async {
      return Right(<app.Task>[]);
    });
    final result = await useCase();
    expect(result.isRight(), true);
  });

  test('Deve retornar RepositoryError em caso de falha', () async {
    when(repo.getAll()).thenThrow(Exception());
    final result = await useCase();
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
