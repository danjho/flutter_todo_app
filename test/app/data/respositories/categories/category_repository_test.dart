import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/data/repositories/categories/category_repository.dart';
import 'package:todo_app/app/domain/dtos/categories/create_category_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final categoryProvider = MockICategoryProvider();
  final repo = CategoryRepository(categoryProvider: categoryProvider);

  late CreateCategoryDto dto;

  setUp(() {
    dto = CreateCategoryDto(name: 'Name', color: '#FFFFFF');
  });
  test('Deve criar uma categoria', () async {
    when(categoryProvider.create(any)).thenAnswer((_) async {
      return Category(
        id: 'uuid',
        name: 'name',
        color: '#AABBCC',
        totalDoneTasks: 0,
        totalTasks: 0,
      );
    });
    final result = await repo.create(dto);
    final fold = result.fold(id, id);
    expect(fold, isA<Category>());
    expect((fold as Category).id, isNotEmpty);
  });

  test('Deve retornar um RepositoryError', () async {
    when(categoryProvider.create(any)).thenThrow(Exception);
    final result = await repo.create(dto);
    expect(result.fold(id, id), isA<RepositoryError>());
  });

  test('Deve retornar uma lista de categorias', () async {
    when(categoryProvider.getAll()).thenAnswer((_) async => <Category>[]);
    final result = await repo.getAll();
    expect(result.fold(id, id), isA<List<Category>>());
  });

  test('Deve retornar um RepositoryError se falhar ao buscar categorias',
      () async {
    when(categoryProvider.getAll()).thenThrow(Exception());
    final result = await repo.getAll();
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
