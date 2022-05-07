import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart';
import 'package:todo_app/app/provider/tasks/api_task_provider.dart';

import '../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final dio = MockDio();
  final apiTaskProvider = ApiTaskProvider(dio: dio);

  test('Deve retornar uma lista de Task', () async {
    when(dio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async {
      return Response(
        requestOptions: RequestOptions(path: 'any_path'),
        data: [],
      );
    });

    final result = await apiTaskProvider.getAll();
    expect(result, isA<List<Task>>());
  });

  test('Deve retornar Exception se houver falha', () async {
    when(dio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenThrow(Exception());
    final future = apiTaskProvider.getAll();
    expect(future, throwsException);
  });

  group('Criar Task', () {
    late CreateTaskDto dto;

    setUp(() {
      dto = CreateTaskDto(
        title: 'Any title',
        date: DateTime.now().add(Duration(days: 1)),
        category: 0,
      );
    });

    test('Deve criar uma Task e retornar o objeto criado', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
            requestOptions: RequestOptions(path: 'any_path'), data: {'id': 0});
      });

      final result = await apiTaskProvider.create(dto);
      expect(result, isA<Task>());
    });

    test('Deve retornar Exception se houver falha', () async {
      when(dio.post(any, data: anyNamed('data'))).thenThrow(Exception());
      final future = apiTaskProvider.create(dto);
      expect(future, throwsException);
    });
  });

  group('Atualizar Task', () {
    late UpdateTaskDto dto;

    setUp(() {
      dto = UpdateTaskDto(
        title: 'Any title',
        id: 0,
        color: Colors.red,
        category: 0,
        date: DateTime.now(),
      );
    });

    test('Deve editar uma Task e retornar o objeto editado', () async {
      when(dio.patch(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
            requestOptions: RequestOptions(path: 'any_path'), data: {'id': 0});
      });

      final result = await apiTaskProvider.update(dto);
      expect(result, isA<Task>());
    });

    test('Deve retornar Exception se houver falha', () async {
      when(dio.patch(any, data: anyNamed('data'))).thenThrow(Exception());
      final future = apiTaskProvider.update(dto);
      expect(future, throwsException);
    });
  });
}
