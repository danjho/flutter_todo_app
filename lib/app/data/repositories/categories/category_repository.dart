import 'package:dartz/dartz.dart';
import 'package:todo_app/app/data/interfaces/categories/i_category_provider.dart';
import 'package:todo_app/app/domain/dtos/categories/create_category_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/core/errors/errors.dart';

class CategoryRepository extends ICategoryRepository {
  CategoryRepository({required this.categoryProvider});

  final ICategoryProvider categoryProvider;

  @override
  Future<Either<RepositoryError, Category>> create(
    CreateCategoryDto dto,
  ) async {
    try {
      final category = await categoryProvider.create(dto);
      return Right(category);
    } catch (e) {
      return Left(RepositoryError());
    }
  }

  @override
  Future<Either<RepositoryError, List<Category>>> getAll() async {
    try {
      final categories = await categoryProvider.getAll();
      return Right(categories);
    } catch (e) {
      return Left(RepositoryError(message: 'Erro inesperado'));
    }
  }
}
