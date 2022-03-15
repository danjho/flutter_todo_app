import 'package:todo_app/core/utils/constants.dart';

class PasswordValidation {
  PasswordValidation._();

  static String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Senha não pode ser vazio';
    }

    if (value.length < MIN_PASSWORD_LENGTH) {
      return 'A senha deve ter no mínimo $MIN_PASSWORD_LENGTH caracteres';
    }

    return null;
  }
}
