import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/global_widgets/app_text_field.dart';
import 'package:todo_app/modules/auth/presenter/log_in/log_in_controller.dart';
import 'package:todo_app/routes/app_routes.dart';

class LogInPage extends GetView<LogInController> {
  const LogInPage({Key? key}) : super(key: key);

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
                      labelText: 'Email',
                      hintText: 'Digite o seu email',
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: controller.emailValidation,
                      onChange: (text) => controller.dto.email = text,
                    ),
                    const SizedBox(height: DEFAULT_PADDING),
                    AppTextField(
                      labelText: 'Password',
                      hintText: 'Digite a sua senha',
                      textInputAction: TextInputAction.done,
                      validator: controller.passwordValidation,
                      onChange: (text) => controller.dto.pwd = text,
                      obscureText: true,
                    ),
                    const SizedBox(height: DEFAULT_PADDING / 2),
                    ElevatedButton(
                      onPressed: controller.logIn,
                      child: Text('Sign in'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.signUp),
                child: Text('Cadastrar-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
