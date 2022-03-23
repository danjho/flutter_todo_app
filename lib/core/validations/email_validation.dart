import 'package:get/get.dart';
import 'package:todo_app/core/validations/empty_fild_validation.dart';

class EmailValidation {
  EmailValidation._();

  static String? validate(String? value) {
    String? result = EmptyFildValidation.validate('Email', value);
    if (result != null) {
      return result;
    }

    if (value == null || !value.isEmail) {
      return 'Email inválido';
    }

    return null;
  }
}
