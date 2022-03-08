import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/routes/app_pages.dart';
import 'package:todo_app/routes/app_routes.dart';

void main() {
  final app = GetMaterialApp(
    title: 'Flutter ToDo App',
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.login,
    getPages: AppPages.pages,
    locale: const Locale('pt', 'BR'),
  );

  runApp(app);
}
