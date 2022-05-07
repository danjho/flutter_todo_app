import 'package:dartz/dartz.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart';
import 'package:todo_app/app/domain/errors/errors.dart';
import 'package:todo_app/app/domain/use_cases/tasks/create_task.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final repo = MockITaskRepository();
  final usecase = CreateTask(repo: repo);
  late CreateTaskDto dto;
  final taskRes = Task(
    id: 0,
    category: 1,
    color: Colors.grey,
    date: DateTime.now(),
    done: false,
    title: 'Title',
  );

  setUp(() {
    dto = CreateTaskDto(
      title: 'Any title',
      date: DateTime.now().add(Duration(days: 1)),
      category: 0,
    );
  });

  test('Deve criar uma Task e retornar o objeto criado', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(taskRes));

    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<Task>());
  });

  test('Deve retornar RepositoryErro em caso de falha no repositório',
      () async {
    when(repo.create(any)).thenAnswer((_) async => d.Left(RepositoryError()));

    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<RepositoryError>());
  });

  test('Deve retornar TaskInputError se não tiver título', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(taskRes));

    dto.title = '';
    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<TaskInputError>());
  });

  test('Deve retornar TaskInputError se não tiver título', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(taskRes));

    dto.title = '';
    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<TaskInputError>());
  });

  test('Deve retornar TaskInputError se a data for antes da atual', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(taskRes));

    dto.date = DateTime.now().subtract(Duration(days: 1));
    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<TaskInputError>());
  });
}
