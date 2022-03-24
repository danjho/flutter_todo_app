import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/providers/api_category_provider.dart';

import 'api_category_provider_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();
  final apiCategoryProvider = ApiCategoryProvider(dio);
  final dto = CreateCategoryDto(name: 'Name', color: '#FFFFFF');

  test('Deve retornar uma categoria criada', () async {
    when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
      return Response(
        requestOptions: RequestOptions(path: 'any_path'),
        data: {'id': 'uuid', 'name': 'name', 'color': '#AABBCC'},
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
}
