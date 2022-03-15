import 'package:get/get.dart';

class EmailValidation {
  EmailValidation._();

  static String? validate(String? value) {
    if (!value!.isEmail) {
      return 'Email inválido';
    }

    return null;
  }
}
