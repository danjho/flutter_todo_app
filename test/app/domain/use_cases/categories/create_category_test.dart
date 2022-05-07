import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/categories/create_category_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/domain/errors/errors.dart';
import 'package:todo_app/app/domain/use_cases/categories/create_category.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final repo = MockICategoryRepository();
  final usecase = CreateCategory(repo: repo);

  late CreateCategoryDto dto;

  setUp(() {
    dto = CreateCategoryDto(name: 'Name', color: Colors.grey);
  });

  test('Retornar CategoryInputError se o nome for vazio', () async {
    dto.name = '';
    final result = await usecase(dto);
    expect(result.fold(id, id), isA<CategoryInputError>());
  });

  test('Deve retornar uma Categoria criada com sucesso', () async {
    when(repo.create(any)).thenAnswer((_) async {
      return Right(Category(
        id: 0,
        name: 'name',
        color: Colors.grey,
        totalDoneTasks: 0,
        totalTasks: 0,
      ));
    });

    final result = await usecase(dto);
    expect(result.fold(id, id), isA<Category>());
  });

  test('Deve retornar uma RepositoryError em caso de erro no repo', () async {
    when(repo.create(any)).thenThrow(Exception);

    final result = await usecase(dto);
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
