class GlobalValidator {
  static String validateFullName(String fullName) {
    if (fullName.trim() == '') {
      return 'Full Name should not be empty';
    } else if (fullName.length > 5) {
      return 'Full name must contain minimum of 5 characters';
    }
    return null;
  }

  static String validateEmail(String email) {
    if (email.contains("@") && email.contains(".")) {
      return null;
    } else {
      return "Invalid Email";
    }
  }

  static String _tempPassword = '';

  static String validatePassword(String password1) {
    if (password1.length > 4) {
      _tempPassword = password1;
      return null;
    } else {
      return "Password length should be min of 5 characters";
    }
  }

  static String validateConfirmPassword(String password2) {
    if (password2.length < 5) {
      return "Password length should be min of 5 characters";
    } else if (password2 != _tempPassword) {
      return "Password does does not match";
    } else {
      return null;
    }
  }
}
