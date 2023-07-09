extension StringValidationExtensions on String {
  bool isValidEmail() {
    // Email validation logic
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(this);
  }
}

extension NullableStringValidationExtensions on String? {
  String? validateEmail() {
    if (this == null || this!.isEmpty) {
      return 'Please enter your email';
    } else if (!(this!).isValidEmail()) {
      return 'Please enter a valid email address';
    }
    return null; // Return null for no validation errors
  }

  String? validatePassword() {
    if (this == null || this!.isEmpty) {
      return 'Please enter your password';
    } else if (this!.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!containsSpecialSymbol()) {
      return 'Password must contain at least one special symbol';
    } else if (!containsNumber()) {
      return 'Password must contain at least one number';
    }
    return null; // Return null for no validation errors
  }
  String? validateMobileNumber() {
    if (this == null || this!.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!(this!).isValidMobileNumber()) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null; // Return null for no validation errors
  }

  bool isValidMobileNumber() {
    final pattern = r'^[0-9]{10}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(this!);
  }
  bool containsSpecialSymbol() {
    final specialSymbolRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return specialSymbolRegex.hasMatch(this!);
  }

  bool containsNumber() {
    final numberRegex = RegExp(r'\d');
    return numberRegex.hasMatch(this!);
  }
}
