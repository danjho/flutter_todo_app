import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/validations/password_validation.dart';

void main() {
  test('Deve retornar uma mensage se a senha for inválida', () async {
    expect(PasswordValidation.validate(''), isA<String>());
  });

  test(
    'Deve retornar uma mensage se a senha for menor que $MIN_PASSWORD_LENGTH',
    () async {
      expect(PasswordValidation.validate('123'), isA<String>());
    },
  );

  test('Deve retornar null se a senha for válida', () async {
    expect(PasswordValidation.validate('123mudar'), isNull);
  });
}
