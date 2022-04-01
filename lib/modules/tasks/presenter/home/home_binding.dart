import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/categories/data/repositories/category_repository.dart';
import 'package:todo_app/modules/categories/providers/api_category_provider.dart';
import 'package:todo_app/modules/tasks/data/repositories/task_repository.dart';
import 'package:todo_app/modules/tasks/providers/api_task_provider.dart';
import 'package:todo_app/modules/tasks/presenter/home/home_controller.dart';

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
