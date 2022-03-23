import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/validations/empty_fild_validation.dart';

class PasswordValidation {
  PasswordValidation._();

  static String? validate(String? value) {
    String? result = EmptyFildValidation.validate('Senha', value);
    if (result != null) {
      return result;
    }

    if (value!.length < MIN_PASSWORD_LENGTH) {
      return 'A senha deve ter no mínimo $MIN_PASSWORD_LENGTH caracteres';
    }

    return null;
  }
}
