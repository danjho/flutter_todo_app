import 'package:todo_app/core/validations/empty_fild_validation.dart';

class NameValidation {
  NameValidation._();

  static String? validate(String? value) {
    String? result = EmptyFildValidation.validate('Nome', value);
    if (result != null) {
      return result;
    }

    if (value!.split(' ').length < 2) {
      return 'Digite o nome e sobrenome';
    }

    for (final name in value.split(' ')) {
      if (name.length <= 2) {
        return 'Nome inválido';
      }
    }

    return null;
  }
}
