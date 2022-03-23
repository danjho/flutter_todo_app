import 'package:dartz/dartz.dart' as d;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/create_task/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/create_task/domain/errors/errors.dart';
import 'package:todo_app/modules/create_task/domain/use_cases/create_task.dart';
import 'package:todo_app/modules/home/domain/entities/task.dart';
import 'package:todo_app/modules/home/domain/repositories/i_task_repository.dart';

import '../../../home/domain/use_cases/get_tasks_test.mocks.dart';

@GenerateMocks([ITaskRepository])
void main() {
  final repo = MockITaskRepository();
  final usecase = CreateTask(repo: repo);
  late CreateTaskDto dto;

  setUp(() {
    dto = CreateTaskDto(
      title: 'Any title',
      date: DateTime.now().add(Duration(days: 1)),
      category: 'category-uuid',
    );
  });

  test('Deve criar uma Task e retornar o objeto criado', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(Task(id: 'uuid')));

    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<Task>());
    expect((result.fold(d.id, d.id) as Task).id, isNotEmpty);
  });

  test('Deve retornar RepositoryErro em caso de falha no repositório',
      () async {
    when(repo.create(any)).thenAnswer((_) async => d.Left(RepositoryError()));

    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<RepositoryError>());
  });

  test('Deve retornar TaskInputError se não tiver título', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(Task()));

    dto.title = '';
    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<TaskInputError>());
  });

  test('Deve retornar TaskInputError se não tiver título', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(Task()));

    dto.title = '';
    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<TaskInputError>());
  });

  test('Deve retornar TaskInputError se não tiver categoria', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(Task()));

    dto.category = '';
    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<TaskInputError>());
  });

  test('Deve retornar TaskInputError se a data for antes da atual', () async {
    when(repo.create(any)).thenAnswer((_) async => d.Right(Task()));

    dto.date = DateTime.now().subtract(Duration(seconds: 1));
    final result = await usecase(dto);
    expect(result.fold(d.id, d.id), isA<TaskInputError>());
  });
}
