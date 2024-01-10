class RegisterValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '*Please enter an email address';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return '*Please enter a valid email address';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return '*Please enter your name';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '*Please enter a password';
    }
    if (value.length < 6) {
      return '*Password must be at least 6 characters long';
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
        .hasMatch(value)) {
      return '*contains at least\n*one uppercase letter\n*contains one lowercase letter\n*contains one number';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}

class LoginValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '*Please enter an email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '*Please enter a password';
    }
    if (value.length < 6) {
      return '*Password must be at least 6 characters long';
    }

    return null;
  }
}
