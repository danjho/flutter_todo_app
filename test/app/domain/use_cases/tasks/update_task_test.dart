import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart' as t;
import 'package:todo_app/app/domain/use_cases/tasks/update_task.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final repo = MockITaskRepository();
  final usecase = UpdateTask(repo);
  late UpdateTaskDto dto;
  final taskRes = t.Task(
    id: 0,
    category: 1,
    color: Colors.grey,
    date: DateTime.now(),
    done: false,
    title: 'Title',
  );

  setUp(() {
    dto = UpdateTaskDto(
      id: 0,
      title: 'Valid title',
      done: false,
      category: 0,
      date: DateTime.now(),
    );
  });

  test('Deve atualizar a tarefa e retornar o objeto criado', () async {
    when(repo.update(any)).thenAnswer((_) async => Right(taskRes));
    final result = await usecase(dto);
    expect(result.fold(id, id), isA<t.Task>());
  });

  test('Deve retornar RepositoryError em caso de erro no repositório',
      () async {
    when(repo.update(any)).thenAnswer((_) async => Left(RepositoryError()));
    final result = await usecase(dto);
    expect(result.fold(id, id), isA<RepositoryError>());
  });

  test('Deve retornar UnexpectedError em caso de erro não tratado', () async {
    when(repo.update(any)).thenThrow(Exception());
    final result = await usecase(dto);
    expect(result.fold(id, id), isA<UnexpectedError>());
  });
}
