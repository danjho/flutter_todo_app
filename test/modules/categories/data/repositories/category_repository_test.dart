import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/categories/data/data_sources/i_category_data_source.dart';
import 'package:todo_app/modules/categories/data/models/category_model.dart';
import 'package:todo_app/modules/categories/data/repositories/category_repository.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';

import 'category_repository_test.mocks.dart';

@GenerateMocks([ICategoryDataSource])
void main() {
  final dataSource = MockICategoryDataSource();
  final repo = CategoryRepository(dataSource: dataSource);

  late CreateCategoryDto dto;

  setUp(() {
    dto = CreateCategoryDto(name: 'Name', color: '#FFFFFF');
  });
  test('Deve criar uma categoria', () async {
    when(dataSource.create(any)).thenAnswer((_) async {
      return CategoryModel(id: 'uuid', name: 'name', color: '#AABBCC');
    });
    final result = await repo.create(dto);
    final fold = result.fold(id, id);
    expect(fold, isA<CategoryModel>());
    expect((fold as CategoryModel).id, isNotEmpty);
  });

  test('Deve retornar um RepositoryError', () async {
    when(dataSource.create(any)).thenThrow(Exception);
    final result = await repo.create(dto);
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
