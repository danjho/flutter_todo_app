import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/home/data/repositories/task_repository.dart';
import 'package:todo_app/modules/home/data_sources/api_task_data_source.dart';
import 'package:todo_app/modules/home/presenter/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final dio = Get.find<Dio>();
    final dataSource = ApiTaskDataSource(dio: dio);
    final repo = TaskRepository(dataSource);
    Get.lazyPut(() => HomeController(repo));
  }
}
