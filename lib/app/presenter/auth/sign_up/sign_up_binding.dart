import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repositories/auth/sign_up_repository.dart';
import 'package:todo_app/app/presenter/auth/sign_up/sign_up_controller.dart';
import 'package:todo_app/app/provider/auth/api_sign_up_provider.dart';
import 'package:todo_app/app/provider/auth/sp_token_provider.dart';
import 'package:todo_app/app/provider/auth/sp_user_provider.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    final tokenProvider = SpTokenProvider();
    final userProvider = SpUserProvider();
    final signUpProvider = ApiSignUpProvider(dio: Get.find<Dio>());
    final repo = SignUpRepository(
      signUpProvider: signUpProvider,
      tokenProvider: tokenProvider,
      userProvider: userProvider,
    );
    Get.lazyPut(() => SignUpController(repo));
  }
}
