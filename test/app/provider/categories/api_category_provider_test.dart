import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/categories/create_category_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/provider/categories/api_category_provider.dart';

import '../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final dio = MockDio();
  final apiCategoryProvider = ApiCategoryProvider(dio);
  final dto = CreateCategoryDto(name: 'Name', color: Colors.grey);

  test('Deve retornar uma categoria criada', () async {
    when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
      return Response(
        requestOptions: RequestOptions(path: 'any_path'),
        data: {
          'id': 'uuid',
          'name': 'name',
          'color': '#AABBCC',
          'totalTasks': 0,
          'totalDoneTasks': 0,
        },
      );
    });
    final category = await apiCategoryProvider.create(dto);
    expect(category.id, isNotEmpty);
  });

  test('Deve retornar uma Exception se der erro no provider', () async {
    when(dio.post(any, data: anyNamed('data'))).thenThrow(Exception());
    final future = apiCategoryProvider.create(dto);
    expect(future, throwsException);
  });

  test(
    'Deve retornar uma lista de Categorias',
    () async {
      when(dio.get(any, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async =>
              Response(requestOptions: RequestOptions(path: 'any'), data: []));
      final result = await apiCategoryProvider.getAll();
      expect(result, isA<List<Category>>());
    },
  );

  test('Deve retornar uma Exception se der erro ao tentar buscas categorias',
      () async {
    when(dio.get(any)).thenThrow(Exception());
    final future = apiCategoryProvider.create(dto);
    expect(future, throwsException);
  });
}
