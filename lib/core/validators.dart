
class FormsValidators {

static String? hasValue(String? value) {
    if (value == null || value.trim().isEmpty) {
     return 'please fill this field';

    }

    return null;
  }


  static String? email(String? email) {
    if (email == null || email.isEmpty) {
      return 'please enter your email';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(email)) {
           return 'please enter corect email';

    }
    return null;
  }

  static String? phoneNumber(String? number) {
    if (number == null || number.isEmpty) {
           return 'please enter your number';

    }
    final numberRegex = RegExp(r"^01[0125][0-9]{8}$");
    if (!numberRegex.hasMatch(number)) {
                 return 'please enter correct number';

    }
    return null;
  }



  static String? password(String? password) {
    /// - Must have at least one numeric character
    /// - Must have at least one lowercase character
    /// - Must have at least one uppercase character
    /// - Must have at least one special symbol among @#$%
    /// - Password length should be between 8 and 20
    ///
    /// (?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$
    if (password == null || password.isEmpty) {
     return 'please enter your password';

    }
    // final passwordRegex = RegExp(
        // r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#,.])[A-Za-z\d@$!%*?&#,.)(]{8,}$");
    // simple password regex to be 8 characters long
    // final passwordRegex = RegExp(r"^(?=.{8,})");
    // if (!passwordRegex.hasMatch(password)) {
    //    return 'please enter strong password';

    // }
    return null;
  }

  static String? confirmPassword(String? password, String originalPassword) {
    if (password != originalPassword) {
     return 'your password dosen\'t match';

    }
    return null;
  }
}
