import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:todo_app/routes/app_pages.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/themes/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  final app = GetMaterialApp(
    title: 'Flutter ToDo App',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    initialRoute: AppRoutes.login,
    getPages: AppPages.pages,
    locale: const Locale('pt', 'BR'),
  );

  runApp(app);
}
