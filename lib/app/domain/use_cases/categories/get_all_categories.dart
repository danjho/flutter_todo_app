import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/core/errors/errors.dart';

class GetAllCategories {
  GetAllCategories({required this.repo});

  final ICategoryRepository repo;

  Future<Either<RepositoryError, List<Category>>> call() {
    return repo.getAll();
  }
}
