import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';

abstract class ICategoryRepository {
  Future<Either<RepositoryError, Category>> create(CreateCategoryDto dto);
  Future<Either<RepositoryError, List<Category>>> getAll();
}
