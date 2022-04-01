import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_globals.dart';
import 'package:todo_app/core/extensions/dio_ext.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    var dio = Dio(BaseOptions(baseUrl: dotenv.env['API_ADDRESS']!));
    if (AppGlobals.token != null) {
      dio.updateInterceptors(AppGlobals.token);
    }
    Get.put(dio);
  }
}
