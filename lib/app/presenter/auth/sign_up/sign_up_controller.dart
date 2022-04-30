import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_up_repository.dart';
import 'package:todo_app/core/validations/password_validation.dart';
import 'package:todo_app/routes/app_routes.dart';

class SignUpController extends GetxController {
  SignUpController(this.repo);

  final ISignUpRepository repo;
  final formKey = GlobalKey<FormState>();
  SignUpDto dto = SignUpDto(name: '', email: '', pwd: '');

  String? passwordConfirmation(String? value) {
    final validation = PasswordValidation.validate(value);
    if (validation != null) {
      return validation;
    }
    if (dto.pwd != dto.pwdConfirmation) {
      return 'As senhas devem ser iguais';
    }
    return null;
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      final result = await repo.signUpWithEmail(dto);
      if (result.isRight()) {
        Get.offAllNamed(AppRoutes.home, arguments: result.fold(id, id));
      }
    }
  }
}
