import 'package:todo_app/core/validations/empty_fild_validation.dart';

class HexColor {
  HexColor._();

  static String? validate(String value) {
    String? result = EmptyFildValidation.validate('Cor', value);
    if (result != null) {
      return result;
    }

    final colorRegex = RegExp(r'^#(?:[0-9a-fA-F]{3}){1,2}$');
    if (!colorRegex.hasMatch(value)) {
      return 'Hexcolor inválido';
    }
    return null;
  }
}
