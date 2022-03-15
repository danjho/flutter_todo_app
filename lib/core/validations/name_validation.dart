class NameValidation {
  NameValidation._();

  static String? validate(String? value) {
    if (value!.isEmpty) {
      return 'O nome não pode ser vazio';
    }

    if (value.split(' ').length < 2) {
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
