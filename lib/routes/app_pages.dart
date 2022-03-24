import 'package:get/get.dart';
import 'package:todo_app/modules/auth/presenter/log_in/log_in_binding.dart';
import 'package:todo_app/modules/auth/presenter/log_in/log_in_page.dart';
import 'package:todo_app/modules/auth/presenter/sign_up/sign_up_binding.dart';
import 'package:todo_app/modules/auth/presenter/sign_up/sign_up_page.dart';
import 'package:todo_app/modules/tasks/presenter/home/home_binding.dart';
import 'package:todo_app/modules/tasks/presenter/home/home_page.dart';
import 'package:todo_app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.logIn,
      page: () => const LogInPage(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
  ];
}
