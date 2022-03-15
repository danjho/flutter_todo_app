import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/validations/hex_color.dart';

void main() {
  test('Retornar null se a hexColor for válida', () async {
    expect(HexColor.validate('#AABBCC'), isNull);
  });

  test('Retornar mensagem de erro se a hexColor for inválida', () async {
    expect(HexColor.validate(''), isA<String>());
    expect(HexColor.validate('AABBCC'), isA<String>());
    expect(HexColor.validate('#12345Z'), isA<String>());
  });
}
