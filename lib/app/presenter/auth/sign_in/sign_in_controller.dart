import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_in_repository.dart';
import 'package:todo_app/app/domain/use_cases/auth/sign_in_with_email.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/routes/app_routes.dart';

class SignInController extends GetxController {
  SignInController(this._repo);

  final ISignInRepository _repo;
  final formKey = GlobalKey<FormState>();
  SignInDto dto = SignInDto(email: '', pwd: '');

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      final doLogin = SignInWithEmail(repo: _repo);
      final result = await doLogin(dto);

      if (result.isLeft()) {
        return;
      }

      Get.offAllNamed(AppRoutes.home, arguments: result.fold(id, id));
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
