import 'package:todo_app/app/domain/dtos/categories/create_category_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';

abstract class ICategoryProvider {
  Future<Category> create(CreateCategoryDto dto);

  Future<List<Category>> getAll();
}
