import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';
import 'package:todo_app/modules/categories/domain/errors/erros.dart';
import 'package:todo_app/modules/categories/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/modules/categories/domain/use_cases/create_category.dart';

import 'create_category_test.mocks.dart';

@GenerateMocks([ICategoryRepository])
void main() {
  final repo = MockICategoryRepository();
  final usecase = CreateCategory(repo: repo);

  late CreateCategoryDto dto;

  setUp(() {
    dto = CreateCategoryDto(name: 'Name', color: '#FFFFFF');
  });

  test('Retornar CategoryInputError se o nome for vazio', () async {
    dto.name = '';
    final result = await usecase(dto);
    expect(result.fold(id, id), isA<CategoryInputError>());
  });

  test('Retornar CategoryInputError se a cor for inválida', () async {
    dto.color = '';
    var result = await usecase(dto);
    expect(result.fold(id, id), isA<CategoryInputError>());

    dto.color = 'FFFFFF';
    result = await usecase(dto);
    expect(result.fold(id, id), isA<CategoryInputError>());

    dto.color = '#FFFFFZ';
    result = await usecase(dto);
    expect(result.fold(id, id), isA<CategoryInputError>());
  });

  test('Deve retornar uma Categoria criada com sucesso', () async {
    when(repo.create(any)).thenAnswer((_) async {
      return Right(
          Category(id: 'uuid', name: 'name', color: '#FFFFFF', tasks: []));
    });

    final result = await usecase(dto);
    expect(result.fold(id, id), isA<Category>());
    expect((result.fold(id, id) as Category).id, isNotEmpty);
  });

  test('Deve retornar uma RepositoryError em caso de erro no repo', () async {
    when(repo.create(any)).thenThrow(Exception);

    final result = await usecase(dto);
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
