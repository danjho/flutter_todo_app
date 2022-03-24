import 'package:dartz/dartz.dart';

import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/hex_color.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';
import 'package:todo_app/modules/categories/domain/errors/erros.dart';
import 'package:todo_app/modules/categories/domain/interfaces/i_category_repository.dart';

class CreateCategory extends UseCase<Category, CreateCategoryDto> {
  CreateCategory({required this.repo});
  final ICategoryRepository repo;
  @override
  Future<Either<Failure, Category>> call(CreateCategoryDto dto) async {
    if (dto.name.isEmpty) {
      return Left(CategoryInputError(message: 'O nome não pode ser vazio'));
    }

    final msg = HexColor.validate(dto.color);
    if (msg != null) {
      return Left(CategoryInputError(message: msg));
    }

    try {
      return repo.create(dto);
    } catch (e) {
      return Left(RepositoryError());
    }
  }
}
