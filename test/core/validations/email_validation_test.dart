import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/validations/email_validation.dart';

void main() {
  test('Deve retornar mensagem de erro se o email for inválido', () async {
    expect(EmailValidation.validate(''), isA<String>());
    expect(EmailValidation.validate('email'), isA<String>());
    expect(EmailValidation.validate('email@email'), isA<String>());
  });

  test('Deve retornar null se for um email válido', () async {
    expect(EmailValidation.validate('valid@email.com'), isNull);
  });
}
