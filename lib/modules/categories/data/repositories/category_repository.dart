import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/categories/data/data_sources/i_category_data_source.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';
import 'package:todo_app/modules/categories/domain/repositories/i_category_repository.dart';

class CategoryRepository extends ICategoryRepository {
  CategoryRepository({required this.dataSource});

  final ICategoryDataSource dataSource;

  @override
  Future<Either<RepositoryError, Category>> create(
    CreateCategoryDto dto,
  ) async {
    try {
      final category = await dataSource.create(dto);
      return Right(category);
    } catch (e) {
      return Left(RepositoryError());
    }
  }
}
