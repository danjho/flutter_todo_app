class EmptyFildValidation {
  EmptyFildValidation._();

  static String? validate(String fieldName, String? value) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName can't be empty";
    }

    return null;
  }
}
