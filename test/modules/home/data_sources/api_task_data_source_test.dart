import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/modules/create_task/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/home/data/models/task_model.dart';
import 'package:todo_app/modules/home/data_sources/api_task_data_source.dart';

import '../../categories/externals/api_category_data_source_test.mocks.dart';

void main() {
  final dio = MockDio();
  final dataSource = ApiTaskDataSource(dio: dio);

  test('Deve retornar uma lista de TaskModel', () async {
    when(dio.get(any)).thenAnswer((_) async {
      return Response(
        requestOptions: RequestOptions(path: 'any_path'),
        data: [],
      );
    });

    final result = await dataSource.getAll();
    expect(result, isA<List<TaskModel>>());
  });

  test('Deve retornar Exception se houver falha', () async {
    when(dio.get(any)).thenThrow(Exception());
    final future = dataSource.getAll();
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

      final result = await dataSource.create(dto);
      expect(result, isA<TaskModel>());
    });

    test('Deve retornar Exception se houver falha', () async {
      when(dio.post(any, data: anyNamed('data'))).thenThrow(Exception());
      final future = dataSource.create(dto);
      expect(future, throwsException);
    });
  });
}
