import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/categories/data/interfaces/i_category_provider.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';

class ApiCategoryProvider extends ICategoryProvider {
  ApiCategoryProvider(this.dio);

  final Dio dio;

  @override
  Future<Category> create(CreateCategoryDto dto) async {
    final res = await dio.post(EndPoint.categories, data: dto.toJson());
    return Category.fromJson(res.data);
  }

  @override
  Future<List<Category>> getAll() async {
    final res = await dio.get(
      EndPoint.categories,
      queryParameters: {'join': 'tasks'},
    );
    return Category.fromList(res.data);
  }
}
