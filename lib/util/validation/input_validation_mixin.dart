mixin InputValidationMixin {
  static const _passwordLength = 6;

  bool isPasswordValid(String password) => password.length == _passwordLength;

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(email);
  }
}
