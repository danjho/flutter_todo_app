import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/categories/data/data_sources/i_category_data_source.dart';
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart';
import 'package:todo_app/modules/categories/data/models/category_model.dart';

class ApiCategoryDataSource extends ICategoryDataSource {
  ApiCategoryDataSource(this.dio);

  final Dio dio;

  @override
  Future<CategoryModel> create(CreateCategoryDto dto) async {
    final res = await dio.post(EndPoint.login, data: dto.toJson());
    return CategoryModel.fromJson(res.data);
  }
}
