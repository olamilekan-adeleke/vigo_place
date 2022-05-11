String? formFieldValidator(String? value, String title, int length) {
  if (value == '' || value == null) {
    return '$title must not be empty!';
  } else if (value.trim().length <= length) {
    return '$title must be over $length characters long!';
  }

  return null;
}



String? passwordValidator(String? value) {
  if (value == '' || value == null) {
    return 'Password must not be empty!';
  } else if (value.trim().length < 6) {
    return 'Password Must be minimum of 6 characters long!';
  }

  return null;
}

String? confirmPasswordValidator(String? value, String password) {
  if (value == '' || value == null) {
    return 'Password must not be empty!';
  } else if (value.trim().length < 6) {
    return 'Password Must be minimum of 6 characters long!';
  } else if (value.trim() != password) {
    return 'Password does not match!';
  }

  return null;
}

String? emailValidator(String? value) {
  if (value == '' || value == null) {
    return 'Email must not be empty!';
  } else if (value.trim().length <= 3) {
    return 'Email must be over 3 characters long!';
  } else if (!value.trim().contains('@')) {
    return 'Invalid Email Address';
  }

  return null;
}



String? nameValidator(String? value) {
  if (value == '' || value == null) {
    return 'Username must not be empty!';
  } else if (value.trim().length <= 2) {
    return 'Username must be min 3 characters long!';
  }
  return null;
}


String? mobileValidator(String? value) {
  if (value == '' || value == null) {
    return 'Mobile must not be empty!';
  } else if (value.trim().length <= 10) {
    return 'Mobile must be min 11 characters long!';
  }
  return null;
}
