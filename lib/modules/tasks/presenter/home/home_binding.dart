import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/tasks/data/repositories/task_repository.dart';
import 'package:todo_app/modules/tasks/providers/api_task_provider.dart';
import 'package:todo_app/modules/tasks/presenter/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final dio = Get.find<Dio>();
    final apiProvider = ApiTaskProvider(dio: dio);
    final repo = TaskRepository(apiProvider);
    Get.lazyPut(() => HomeController(repo));
  }
}
