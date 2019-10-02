//import 'package:cricmates/utils/strings.dart';
//
//class FieldValidator {
//  static String validateEmail(String value) {
//    print("validateEmail : $value ");
//
//    if (value.isEmpty) return Strings.enterEmail;
//
//    Pattern pattern =
//        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//
//    RegExp regex = new RegExp(pattern);
//
//    if (!regex.hasMatch(value.trim())) {
//      return Strings.enterValidEmail;
//    }
//
//    return null;
//  }
//
//  /// Password matching expression. Password must be at least 4 characters,
//  /// no more than 8 characters, and must include at least one upper case letter,
//  /// one lower case letter, and one numeric digit.
//  static String validatePassword(String value) {
//    print("validateEmail : $value ");
//
//    if (value.isEmpty) return Strings.enterPassword;
//
//    Pattern pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$';
//
//    RegExp regex = new RegExp(pattern);
//
//    if (!regex.hasMatch(value.trim())) {
//      return Strings.enterValidPassword;
//    }
//
//    return null;
//  }
//}
class FormValidator {
  static FormValidator _instance;

  factory FormValidator() => _instance ??= new FormValidator._();

  FormValidator._();

  String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
//      print("email id : ${value}");
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    String patttern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Password is Required";
    } else if (value.length < 8) {
      return "Password must minimum eight characters";
    } else if (!regExp.hasMatch(value)) {
      return "Password at least one uppercase letter, one lowercase letter and one number";
    }
    return null;
  }
}
