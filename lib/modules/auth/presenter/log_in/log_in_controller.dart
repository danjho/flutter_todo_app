import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_log_in_repository.dart';
import 'package:todo_app/modules/auth/domain/use_cases/log_in_with_email.dart';
import 'package:todo_app/routes/app_routes.dart';

class LogInController extends GetxController {
  LogInController(this._repo);

  final ILogInRepository _repo;
  final formKey = GlobalKey<FormState>();
  LogInDto dto = LogInDto(email: '', pwd: '');

  Future<void> logIn() async {
    if (formKey.currentState!.validate()) {
      final doLogin = LogInWithEmail(repo: _repo);
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
