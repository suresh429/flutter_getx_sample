
class Validator {
  String? usernameValidator(String value) {
    if (value.isEmpty || value.length < 8) {
      return "Enter valid username";
    } else if (value.contains("!") || value.contains("#")) {
      return "should not contain special characters.";
    }
    return null;
  }

 String? validEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return "Enter valid email";
    }
    return null;
  }

  String? validPhone(String phone) {
    if (phone.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }

  }

  String? validPassword(String password) {
    if (password.length != 10) {
      return 'password must be 10 characters';
    } else {
      return null;
    }

  }

  String? descriptionValidator(String value) {
    if (value.isEmpty || value.length < 10) {
      return "Enter Description";
    }
    return null;
  }
}
