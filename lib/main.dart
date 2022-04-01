import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_binding.dart';
import 'package:todo_app/app_globals.dart';
import 'package:todo_app/modules/auth/data/models/user_model.dart';
import 'package:todo_app/modules/auth/providers/sp_token_provider.dart';
import 'package:todo_app/modules/auth/providers/sp_user_provider.dart';
import 'package:todo_app/routes/app_pages.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/themes/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  AppGlobals.token = await SpTokenProvider().getToken();
  final userJson = await SpUserProvider().getUser();
  if (userJson != null) {
    AppGlobals.user = UserModel.fromJson(json.decode(userJson));
  }

  final isLoggedIn = AppGlobals.token != null && AppGlobals.user != null;

  final app = GetMaterialApp(
    title: 'Flutter ToDo App',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.logIn,
    initialBinding: AppBinding(),
    getPages: AppPages.pages,
    locale: const Locale('pt', 'BR'),
  );

  runApp(app);
}
