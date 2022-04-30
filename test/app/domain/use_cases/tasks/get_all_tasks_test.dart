import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/entities/task.dart' as app;
import 'package:todo_app/app/domain/use_cases/tasks/get_all_tasks.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

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
