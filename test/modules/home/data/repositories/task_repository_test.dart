import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/create_task/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/home/data/data_sources/i_task_data_source.dart';
import 'package:todo_app/modules/home/data/models/task_model.dart';
import 'package:todo_app/modules/home/data/repositories/task_repository.dart';
import 'package:todo_app/modules/home/domain/entities/task.dart' as e;

import 'task_repository_test.mocks.dart';

@GenerateMocks([ITaskDataSource])
void main() {
  final dataSource = MockITaskDataSource();
  final repo = TaskRepository(dataSource);

  test('Deve retornar uma lista de tarefas', () async {
    when(dataSource.getAll()).thenAnswer((_) async {
      return <TaskModel>[];
    });
    final result = await repo.getAll();
    expect(result.isRight(), true);
  });

  test('Deve retornar DataSourceError em caso de falha', () async {
    when(dataSource.getAll()).thenThrow(Exception());
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
      when(dataSource.create(any)).thenAnswer((_) async {
        return e.Task(id: 'uuid');
      });
      final result = await repo.create(dto);
      expect(result.isRight(), true);
      expect((result.fold(id, id) as e.Task).id, isNotEmpty);
    });

    test('Deve retornar Error em caso de falha', () async {
      when(dataSource.create(any)).thenThrow(Exception());
      final result = await repo.create(dto);
      expect(result.fold(id, id), isA<RepositoryError>());
    });
  });
}
