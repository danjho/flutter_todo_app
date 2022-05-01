import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repositories/categories/category_repository.dart';
import 'package:todo_app/app/data/repositories/tasks/task_repository.dart';
import 'package:todo_app/app/presenter/tasks/crud/task_crud_controller.dart';
import 'package:todo_app/app/provider/categories/api_category_provider.dart';
import 'package:todo_app/app/provider/tasks/api_task_provider.dart';

class TaskCrudBinding implements Bindings {
  @override
  void dependencies() {
    final taskProvider = ApiTaskProvider(dio: Get.find<Dio>());
    final taskRepo = TaskRepository(taskProvider);

    final categoryProvider = ApiCategoryProvider(Get.find<Dio>());
    final categoryRepo = CategoryRepository(categoryProvider: categoryProvider);

    Get
      ..lazyPut(() => categoryRepo)
      ..lazyPut(() => TaskCrudController(
            taskRepo: taskRepo,
            categoryRepo: categoryRepo,
          ));
  }
}
