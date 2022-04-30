import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/dtos/categories/create_category_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/core/errors/errors.dart';

abstract class ICategoryRepository {
  Future<Either<RepositoryError, Category>> create(CreateCategoryDto dto);

  Future<Either<RepositoryError, List<Category>>> getAll();
}
