import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';

abstract class ICategoryProvider {
  Future<Category> create(CreateCategoryDto dto);
  Future<List<Category>> getAll();
}
