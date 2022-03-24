import 'package:dartz/dartz.dart';

import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';
import 'package:todo_app/modules/categories/domain/interfaces/i_category_repository.dart';

class GetAllCategories {
  GetAllCategories({required this.repo});

  final ICategoryRepository repo;

  Future<Either<RepositoryError, List<Category>>> call() {
    return repo.getAll();
  }
}
