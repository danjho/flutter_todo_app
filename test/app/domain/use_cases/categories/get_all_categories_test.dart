import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/domain/use_cases/categories/get_all_categories.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final repo = MockICategoryRepository();
  final useCase = GetAllCategories(repo: repo);
  test('Deve retornar uma lista de categorias', () async {
    when(repo.getAll()).thenAnswer((_) async => Right(<Category>[]));
    final result = await useCase();
    expect(result.fold(id, id), isA<List<Category>>());
  });

  test('Deve retornar RepositoryError em caso de falhas', () async {
    when(repo.getAll()).thenAnswer((_) async => Left(RepositoryError()));
    final result = await useCase();
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
