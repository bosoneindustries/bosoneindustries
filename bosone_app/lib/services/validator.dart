class Validator {
  static String? validateName({required String name}) {
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }
    return null;
  }

  static String? validateEmail({required String email}) {
    if (email == null) {
      return null;
    }
  }
}
