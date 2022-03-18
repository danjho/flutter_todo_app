import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/home/data/data_sources/i_task_data_source.dart';
import 'package:todo_app/modules/home/data/repositories/task_repository.dart';
import 'package:todo_app/modules/home/domain/entities/task.dart' as app;

import 'task_repository_test.mocks.dart';

@GenerateMocks([ITaskDataSource])
void main() {
  final dataSource = MockITaskDataSource();
  final repo = TaskRepository(dataSource);

  test('Deve retornar uma lista de tarefas', () async {
    when(dataSource.getAll()).thenAnswer((realInvocation) async {
      return <app.Task>[];
    });
    final result = await repo.getAll();
    expect(result.isRight(), true);
  });

  test('Deve retornar DataSourceError em caso de falha', () async {
    when(dataSource.getAll()).thenThrow(Exception());
    final result = await repo.getAll();
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
