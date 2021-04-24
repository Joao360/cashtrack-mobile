final emailValidationRegExp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

String nameValidator(value) {
  if (value.isEmpty) {
    return 'Please enter your name';
  }

  return null;
}

String emailValidator(value) {
  if (value.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(emailValidationRegExp).hasMatch(value)) {
    return 'Email is invalid';
  }
  return null;
}

String passwordValidator(value) {
  if (value.isEmpty) {
    return 'Password cannot be empty';
  }
  return null;
}