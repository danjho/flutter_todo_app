import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repositories/categories/category_repository.dart';
import 'package:todo_app/app/presenter/categories/list/category_management_controller.dart';
import 'package:todo_app/app/provider/categories/api_category_provider.dart';

class CategoryManagementBinding implements Bindings {
  @override
  void dependencies() {
    final categoryProvider = ApiCategoryProvider(Get.find<Dio>());
    final categoryRepo = CategoryRepository(categoryProvider: categoryProvider);
    Get
      ..lazyPut(() => categoryRepo)
      ..lazyPut(() => CategoryManagementController(categoryRepo));
  }
}
