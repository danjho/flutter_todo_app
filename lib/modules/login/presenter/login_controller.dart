import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/login/domain/dtos/login_dto.dart';
import 'package:todo_app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:todo_app/modules/login/domain/use_cases/login_with_email.dart';
import 'package:todo_app/routes/app_routes.dart';

class LoginController extends GetxController {
  LoginController(this._repo);

  final ILoginRepository _repo;
  final formKey = GlobalKey<FormState>();
  LoginDto dto = LoginDto(email: '', pwd: '');

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final doLogin = LoginWithEmail(repo: _repo);
      final result = await doLogin(dto);

      if (result.isLeft()) {
        return;
      }

      Get.offAllNamed(AppRoutes.home);
    }
  }

  String? emailValidation(String? email) {
    if (email!.isEmpty) {
      return 'O email não pode ser vazio';
    }

    if (!email.isEmail) {
      return 'Email inválido';
    }

    return null;
  }

  String? passwordValidation(String? pwd) {
    if (pwd!.isEmpty) {
      return 'O password não pode ser vazio';
    }

    if (pwd.length.isLowerThan(MIN_PASSWORD_LENGTH)) {
      return 'O password deve ter no mínimo $MIN_PASSWORD_LENGTH caracteres';
    }

    return null;
  }
}
