import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:todo_app/modules/tasks/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';
import 'package:todo_app/modules/tasks/providers/api_task_provider.dart';

import '../../../core/mocks/all_generated_mocks.mocks.dart';


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

  group('Criar Tast', () {
    late CreateTaskDto dto;

    setUp(() {
      dto = CreateTaskDto(
        title: 'Any title',
        date: DateTime.now().add(Duration(days: 1)),
        category: 'category-uuid',
      );
    });

    test('Deve criar uma Task e retornar o objeto criado', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(path: 'any_path'),
          data: {'id': 'uuid'},
        );
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
}
