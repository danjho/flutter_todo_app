import 'package:todo_app/modules/categories/data/models/category_model.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';

abstract class ICategoryDataSource {
  Future<CategoryModel> create(CreateCategoryDto dto);
}
