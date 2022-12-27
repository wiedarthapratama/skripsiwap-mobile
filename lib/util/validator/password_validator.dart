part of 'validator.dart';

class PasswordValidator {
  static bool validate(String value) {
    // String symbol = '(?=.*?[!@#\$&*~])';
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
