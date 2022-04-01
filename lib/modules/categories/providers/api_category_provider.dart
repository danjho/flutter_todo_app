import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/categories/data/interfaces/i_category_provider.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/data/models/category_model.dart';

class ApiCategoryProvider extends ICategoryProvider {
  ApiCategoryProvider(this.dio);

  final Dio dio;

  @override
  Future<CategoryModel> create(CreateCategoryDto dto) async {
    final res = await dio.post(EndPoint.categories, data: dto.toJson());
    return CategoryModel.fromJson(res.data);
  }

  @override
  Future<List<CategoryModel>> getAll() async {
    final res = await dio.get(
      EndPoint.categories,
      queryParameters: {'join': 'tasks'},
    );
    return CategoryModel.fromList(res.data);
  }
}
