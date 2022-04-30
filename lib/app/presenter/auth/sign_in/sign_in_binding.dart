import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repositories/auth/sign_in_repository.dart';
import 'package:todo_app/app/presenter/auth/sign_in/sign_in_controller.dart';
import 'package:todo_app/app/provider/auth/api_sign_in_provider.dart';
import 'package:todo_app/app/provider/auth/sp_token_provider.dart';
import 'package:todo_app/app/provider/auth/sp_user_provider.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    final loginProvider = ApiSignInProvider(dio: Get.find<Dio>());
    final tokenProvider = SpTokenProvider();
    final userProvider = SpUserProvider();
    final repo = SignInRepository(
      signInProvider: loginProvider,
      tokenProvider: tokenProvider,
      userProvider: userProvider,
    );
    Get.lazyPut(() => SignInController(repo));
  }
}
