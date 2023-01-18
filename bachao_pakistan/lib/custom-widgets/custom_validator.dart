String? validateName(String? name) {
  if (name == null || name.isEmpty) {
    return 'name is required.';
  }
  return null;
}

String? validate2Name(String? name) {
  if (name == null || name.isEmpty) {
    return 'name is required.';
  }
  return null;
}

String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (email == null || email.isEmpty) {
    return 'email is required.';
  }
  if (!emailRegex.hasMatch(email)) {
    return 'Invalid Email';
  }
  return null;
}

String? validate2Email(String? email) {
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (email == null || email.isEmpty) {
    return 'email is required.';
  }
  if (!emailRegex.hasMatch(email)) {
    return 'Invalid Email';
  }

  return null;
}

String? validatePassword(String? password) {
  RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (password == null || password.isEmpty) {
    return 'password is required.';
  }

  if (!passwordRegex.hasMatch(password)) {
    return 'Password must contain at least one capital letter, one special character, and a number!';
  }
  return null;
}
