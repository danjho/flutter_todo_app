import 'package:get/get.dart';
import 'package:todo_app/modules/home/ui/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
