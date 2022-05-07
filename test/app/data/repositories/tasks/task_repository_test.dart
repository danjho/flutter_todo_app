import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/data/repositories/tasks/task_repository.dart';
import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart' as e;
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final taskProvider = MockITaskProvider();
  final repo = TaskRepository(taskProvider);

  test('Deve retornar uma lista de tarefas', () async {
    when(taskProvider.getAll()).thenAnswer((_) async {
      return <e.Task>[];
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
        category: 0,
      );
    });
    test('Deve criar uma Task e retornar o objeto criado', () async {
      when(taskProvider.create(any)).thenAnswer((_) async {
        return e.Task(
          id: 0,
          category: 1,
          color: Colors.grey,
          date: DateTime.now(),
          done: false,
          title: 'Title',
        );
      });
      final result = await repo.create(dto);
      expect(result.isRight(), true);
    });

    test('Deve retornar Error em caso de falha', () async {
      when(taskProvider.create(any)).thenThrow(Exception());
      final result = await repo.create(dto);
      expect(result.fold(id, id), isA<RepositoryError>());
    });
  });

  group('Atualizar tarefa', () {
    late UpdateTaskDto dto;
    setUp(() {
      dto = UpdateTaskDto(
        id: 0,
        title: 'Any title',
        done: true,
        category: 0,
        date: DateTime.now(),
      );
    });
    test('Deve criar uma Task e retornar o objeto criado', () async {
      when(taskProvider.update(any)).thenAnswer((_) async {
        return e.Task(
          id: 0,
          category: 1,
          color: Colors.grey,
          date: DateTime.now(),
          done: false,
          title: 'Title',
        );
      });
      final result = await repo.update(dto);
      expect(result.isRight(), true);
      expect((result.fold(id, id) as e.Task).id, 0);
    });

    test('Deve retornar Error em caso de falha', () async {
      when(taskProvider.update(any)).thenThrow(Exception());
      final result = await repo.update(dto);
      expect(result.fold(id, id), isA<UnexpectedError>());
    });
  });
}
