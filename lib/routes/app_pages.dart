import 'package:get/get.dart';
import 'package:todo_app/modules/home/ui/home_binding.dart';
import 'package:todo_app/modules/home/ui/home_page.dart';
import 'package:todo_app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
