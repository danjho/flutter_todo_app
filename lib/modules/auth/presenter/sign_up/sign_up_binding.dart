import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/auth/data/repositories/sign_up_with_email_repository.dart';
import 'package:todo_app/modules/auth/presenter/sign_up/sign_up_controller.dart';
import 'package:todo_app/modules/auth/providers/api_sign_up_provider.dart';
import 'package:todo_app/modules/auth/providers/sp_token_provider.dart';
import 'package:todo_app/modules/auth/providers/sp_user_provider.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    final tokenProvider = SpTokenProvider();
    final userProvider = SpUserProvider();
    final signUpProvider = ApiSignUpProvider(dio: Get.find<Dio>());
    final repo = SignUpWithEmailRepository(
      signUpProvider: signUpProvider,
      tokenProvider: tokenProvider,
      userProvider: userProvider,
    );
    Get.lazyPut(() => SignUpController(repo));
  }
}
