class HexColor {
  HexColor._();

  static String? validate(String value) {
    if (value.isEmpty) {
      return 'A cor não pode ser vazia';
    }

    final colorRegex = RegExp(r'^#(?:[0-9a-fA-F]{3}){1,2}$');
    if (!colorRegex.hasMatch(value)) {
      return 'Hexcolor inválido';
    }
    return null;
  }
}
