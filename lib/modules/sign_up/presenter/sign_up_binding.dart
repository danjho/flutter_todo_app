import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/login/externals/data_sources/token_sp_data_source.dart';
import 'package:todo_app/modules/sign_up/data/repositories/sign_up_with_email_repository.dart';
import 'package:todo_app/modules/sign_up/externals/api_sign_up_data_source.dart';
import 'package:todo_app/modules/sign_up/presenter/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    final localDataSource = TokenSpDataSource();
    final dataSource = ApiSignUpDataSource(dio: Get.find<Dio>());
    final repo = SignUpWithEmailRepository(
      dataSource: dataSource,
      localDataSource: localDataSource,
    );
    Get.lazyPut(() => SignUpController(repo));
  }
}
