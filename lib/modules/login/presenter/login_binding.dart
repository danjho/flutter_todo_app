import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/login/data/repositories/login_repository.dart';
import 'package:todo_app/modules/login/externals/data_sources/api_login_data_source.dart';
import 'package:todo_app/modules/login/presenter/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    final datasource = ApiLoginDataSource(dio: Get.find<Dio>());
    final repo = LoginRepository(datasource: datasource);
    Get.lazyPut(() => LoginController(repo));
  }
}
