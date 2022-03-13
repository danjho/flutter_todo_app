import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    var dio = Dio(BaseOptions(baseUrl: dotenv.env['API_ADDRESS']!));
    Get.put(dio);
  }
}
