import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/validations/name_validation.dart';

void main() {
  test('Deve retornar uma mensagem se o nome estiver vazio', () async {
    expect(NameValidation.validate(''), isA<String>());
  });

  test('Deve retornar uma mensagem se o nome não for composto', () async {
    expect(NameValidation.validate('any'), isA<String>());
  });

  test('Deve retornar uma mensagem se o nome tiper 2 letras', () async {
    expect(NameValidation.validate('AA BB'), isA<String>());
  });

  test('Deve retornar null se o nome for válido', () async {
    expect(NameValidation.validate('Nome Sobrenome'), isNull);
  });
}
