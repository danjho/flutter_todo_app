import 'package:get/get.dart';
import 'package:todo_app/app/presenter/auth/sign_in/sign_in_binding.dart';
import 'package:todo_app/app/presenter/auth/sign_in/sign_in_page.dart';
import 'package:todo_app/app/presenter/auth/sign_up/sign_up_binding.dart';
import 'package:todo_app/app/presenter/auth/sign_up/sign_up_page.dart';
import 'package:todo_app/app/presenter/categories/list/category_management_binding.dart';
import 'package:todo_app/app/presenter/categories/list/category_management_page.dart';
import 'package:todo_app/app/presenter/home/home_binding.dart';
import 'package:todo_app/app/presenter/home/home_page.dart';
import 'package:todo_app/app/presenter/tasks/crud/task_crud_binding.dart';
import 'package:todo_app/app/presenter/tasks/crud/task_crud_page.dart';
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
      name: AppRoutes.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.taskCrud,
      page: () => const TaskCrudPage(),
      binding: TaskCrudBinding(),
    ),

    // CATEGORIES
    GetPage(
      name: AppRoutes.categoryManagement,
      page: () => const CategoryManagementPage(),
      binding: CategoryManagementBinding(),
    ),
  ];
}
