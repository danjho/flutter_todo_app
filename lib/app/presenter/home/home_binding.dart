import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repositories/categories/category_repository.dart';
import 'package:todo_app/app/data/repositories/tasks/task_repository.dart';
import 'package:todo_app/app/presenter/home/home_controller.dart';
import 'package:todo_app/app/provider/categories/api_category_provider.dart';
import 'package:todo_app/app/provider/tasks/api_task_provider.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final dio = Get.find<Dio>();
    final apiProvider = ApiTaskProvider(dio: dio);
    final categoryProvider = ApiCategoryProvider(dio);
    final taskRepo = TaskRepository(apiProvider);
    final categoryRepo = CategoryRepository(categoryProvider: categoryProvider);
    Get.lazyPut(() => HomeController(
          taskRepo: taskRepo,
          categoryRepo: categoryRepo,
        ));
  }
}
