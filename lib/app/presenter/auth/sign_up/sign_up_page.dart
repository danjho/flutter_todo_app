import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/presenter/auth/sign_up/sign_up_controller.dart';
import 'package:todo_app/app/presenter/global_widgets/app_text_field.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/validations/email_validation.dart';
import 'package:todo_app/core/validations/name_validation.dart';
import 'package:todo_app/core/validations/password_validation.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 254,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'LogIn to your Account',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: DEFAULT_PADDING),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextField(
                      labelText: 'Nome',
                      hintText: 'Digite o seu nome',
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: NameValidation.validate,
                      onChange: (text) => controller.dto.name = text,
                    ),
                    const SizedBox(height: DEFAULT_PADDING),
                    AppTextField(
                      labelText: 'Email',
                      hintText: 'Digite o seu email',
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: EmailValidation.validate,
                      onChange: (text) => controller.dto.email = text,
                    ),
                    const SizedBox(height: DEFAULT_PADDING),
                    AppTextField(
                      labelText: 'Senha',
                      hintText: 'Digite a sua senha',
                      textInputAction: TextInputAction.done,
                      validator: PasswordValidation.validate,
                      onChange: (text) => controller.dto.pwd = text,
                      obscureText: true,
                    ),
                    const SizedBox(height: DEFAULT_PADDING),
                    AppTextField(
                      labelText: 'Confirme a senha',
                      hintText: 'Digite a sua senha novamente',
                      textInputAction: TextInputAction.done,
                      validator: controller.passwordConfirmation,
                      onChange: (text) => controller.dto.pwdConfirmation = text,
                      obscureText: true,
                    ),
                    const SizedBox(height: DEFAULT_PADDING / 2),
                    ElevatedButton(
                      onPressed: controller.signUp,
                      child: Text('Sign up'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
