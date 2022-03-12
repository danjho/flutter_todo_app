import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/global_widgets/app_text_field.dart';
import 'package:todo_app/modules/login/presenter/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
                'Login to your Account',
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
                      onPressed: controller.login,
                      child: Text('Sign in'),
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
