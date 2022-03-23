class EmptyFildValidation {
  EmptyFildValidation._();

  static String? validate(String fieldName, String? value) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName não pode ser vazio';
    }

    return null;
  }
}
