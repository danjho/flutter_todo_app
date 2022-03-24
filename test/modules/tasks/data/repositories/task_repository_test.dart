import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/tasks/data/interfaces/i_task_provider.dart';
import 'package:todo_app/modules/tasks/data/models/task_model.dart';
import 'package:todo_app/modules/tasks/data/repositories/task_repository.dart';
import 'package:todo_app/modules/tasks/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart' as e;

import 'task_repository_test.mocks.dart';

@GenerateMocks([ITaskProvider])
void main() {
  final taskProvider = MockITaskProvider();
  final repo = TaskRepository(taskProvider);

  test('Deve retornar uma lista de tarefas', () async {
    when(taskProvider.getAll()).thenAnswer((_) async {
      return <TaskModel>[];
    });
    final result = await repo.getAll();
    expect(result.isRight(), true);
  });

  test('Deve retornar DataSourceError em caso de falha', () async {
    when(taskProvider.getAll()).thenThrow(Exception());
    final result = await repo.getAll();
    expect(result.fold(id, id), isA<RepositoryError>());
  });

  group('Criar tarefa', () {
    late CreateTaskDto dto;
    setUp(() {
      dto = CreateTaskDto(
        title: 'Any title',
        date: DateTime.now(),
        category: 'uuid',
      );
    });
    test('Deve criar uma Task e retornar o objeto criado', () async {
      when(taskProvider.create(any)).thenAnswer((_) async {
        return e.Task(id: 'uuid');
      });
      final result = await repo.create(dto);
      expect(result.isRight(), true);
      expect((result.fold(id, id) as e.Task).id, isNotEmpty);
    });

    test('Deve retornar Error em caso de falha', () async {
      when(taskProvider.create(any)).thenThrow(Exception());
      final result = await repo.create(dto);
      expect(result.fold(id, id), isA<RepositoryError>());
    });
  });
}
