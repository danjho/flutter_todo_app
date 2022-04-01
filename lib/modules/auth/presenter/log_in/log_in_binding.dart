import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/auth/data/repositories/log_in_repository.dart';
import 'package:todo_app/modules/auth/presenter/log_in/log_in_controller.dart';
import 'package:todo_app/modules/auth/providers/api_log_in_provider.dart';
import 'package:todo_app/modules/auth/providers/sp_token_provider.dart';
import 'package:todo_app/modules/auth/providers/sp_user_provider.dart';

class LogInBinding implements Bindings {
  @override
  void dependencies() {
    final loginProvider = ApiLogInProvider(dio: Get.find<Dio>());
    final tokenProvider = SpTokenProvider();
    final userProvider = SpUserProvider();
    final repo = LogInRepository(
      logInProvider: loginProvider,
      tokenProvider: tokenProvider,
      userProvider: userProvider,
    );
    Get.lazyPut(() => LogInController(repo));
  }
}
