String? formFieldValidator(String? value, String title, int length) {
  if (value == '' || value == null) {
    return '$title must not be empty!';
  } else if (value.trim().length <= length) {
    return '$title must be over $length characters long!';
  }

  return null;
}

String? pinValidator(String? value) {
  if (value == '' || value == null) {
    return 'Pin must not be empty!';
  } else if (value.trim().length < 4) {
    return 'Pin Must be minimum of 4 characters long!';
  }

  return null;
}

String? otpValidator(String? value) {
  if (value == '' || value == null) {
    return 'OTP must not be empty!';
  } else if (value.trim().length < 4) {
    return 'OTP Must be minimum of 4 characters long!';
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

String? yearValidator(String? value) {
  if (value == '' || value == null) {
    return 'Year must not be empty!';
  } else if (value.trim().length <= 3) {
    return 'Year must be 4 characters long! e.g "2015"';
  }
  return null;
}

String? vinValidator(String? value) {
  if (value == '' || value == null) {
    return 'Year must not be empty!';
  } else if (value.trim().length <= 3) {
    return 'Year must be over 3 characters long!';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == '' || value == null) {
    return 'Name must not be empty!';
  } else if (value.trim().length <= 2) {
    return 'Name must be min 3 characters long!';
  }
  return null;
}

String? priceValidator(String? value) {
  if (value == '' || value == null) {
    return 'Price must not be empty!';
  } else if (int.parse(value.trim()) < 9999) {
    return 'Min Price is NGN 10,000!';
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
