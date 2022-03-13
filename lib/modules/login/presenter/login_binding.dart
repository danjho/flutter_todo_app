import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/login/data/repositories/login_repository.dart';
import 'package:todo_app/modules/login/externals/data_sources/api_login_data_source.dart';
import 'package:todo_app/modules/login/presenter/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    final apiAddress = dotenv.env['API_ADDRESS'];
    final datasource = ApiLoginDataSource(
      dio: Dio(BaseOptions(baseUrl: apiAddress!)),
    );
    final repo = LoginRepository(datasource: datasource);
    Get.lazyPut(() => LoginController(repo));
  }
}
