import '../utils/color_data.dart';

class Validations {
  static String handleFirebaseAuthError(String e) {
    if (e.contains("ERROR_WEAK_PASSWORD")) {
      return "Password is too weak";
    } else if (e.contains("invalid-email")) {
      return "Invalid Email";
    } else if (e.contains("ERROR_EMAIL_ALREADY_IN_USE") ||
        e.contains('email-already-in-use')) {
      return "The email address is already in use by another account.";
    } else if (e.contains("ERROR_NETWORK_REQUEST_FAILED")) {
      return "Network error occured!";
    } else if (e.contains("ERROR_USER_NOT_FOUND") ||
        e.contains('firebase_auth/user-not-found')) {
      return "Invalid credentials.";
    } else if (e.contains("ERROR_WRONG_PASSWORD") ||
        e.contains('wrong-password')) {
      return "Invalid credentials.";
    } else if (e.contains('firebase_auth/requires-recent-login')) {
      return 'This operation is sensitive and requires recent authentication.'
          ' Log in again before retrying this request.';
    } else if (e.contains('firebase_auth/channel-error')) {
      return 'Invalid credentials.';
    } else if (e.contains('firebase_auth/INVALID_LOGIN_CREDENTIALS')) {
      return 'Invalid login credentials.';
    } else {
      return e;
    }
  }

  static String handleSingUpScreenError({
    fullNameTextController,
    userNameTextController,
    emailTextController,
    initialsTextController,
    passwordTextController,
    confirmPasswordTextController,
    isSelectedTermAndCondition,
  }) {
    if (fullNameTextController.text.isEmpty) {
      return "Full name not be empty.";
    } else if (userNameTextController.text.isEmpty) {
      return "Username not be empty.";
    } else if (emailTextController.text.isEmpty) {
      return "Email not be empty.";
    } else if (initialsTextController.text.isEmpty) {
      return "Initials not be empty.";
    } else if (passwordTextController.text.isEmpty) {
      return "Password not be empty.";
    } else if (confirmPasswordTextController.text.isEmpty) {
      return "Confirm Password not be empty.";
    } else if (!isValidEmail.hasMatch(emailTextController.text)) {
      return "Please check your email.";
    } else if (passwordTextController.text.length < 8) {
      return "Password must be at least 8 characters in length.";
    } else if (confirmPasswordTextController.text.length < 8) {
      return "Confirm password must be at least 8 characters in length.";
    } else if (!isValidPassword.hasMatch(passwordTextController.text)) {
      return "Password should contain at least one upper case, lower case, one digit, Special character.";
    } else if (!isValidPassword.hasMatch(confirmPasswordTextController.text)) {
      return "Confirm password should contain at least one upper case, lower case, one digit, Special character.";
    } else if (confirmPasswordTextController.text !=
            passwordTextController.text ||
        passwordTextController.text != confirmPasswordTextController.text) {
      return "Passwords do not match.";
    } else if (isSelectedTermAndCondition == false) {
      return "Please select the option of 'Do you agreed with our Term & Condition and Privacy policy'.";
    } else {
      return '';
    }
  }

  static String handleLoginScreenError({
    emailTextController,
    passwordTextController,
  }) {
    if (emailTextController.text.isEmpty) {
      return "Email not be empty.";
    } else if (passwordTextController.text.isEmpty) {
      return "Password not be empty.";
    } else if (!isValidEmail.hasMatch(emailTextController.text)) {
      return "Please check your email.";
    } else if (passwordTextController.text.length < 8) {
      return "Password must be at least 8 characters in length.";
    } else if (!isValidPassword.hasMatch(passwordTextController.text)) {
      return "Password should contain at least one upper case, lower case, one digit, Special character.";
    } else {
      return '';
    }
  }

  static String handleForgotPasswordEmailScreenError({
    emailTextController,
  }) {
    if (emailTextController.text.isEmpty) {
      return "Email not be empty.";
    } else if (!isValidEmail.hasMatch(emailTextController.text)) {
      return "Please check your email.";
    } else {
      return '';
    }
  }

  static String handleForgotPasswordOTPScreenError({
    otpTextController,
  }) {
    if (otpTextController.text.isEmpty) {
      return "OTP not be empty.";
    } else {
      return '';
    }
  }

  static String handleForgotPasswordChangePasswordScreenError({
    passwordTextController,
    confirmPasswordTextController,
  }) {
    if (passwordTextController.text.isEmpty) {
      return "Password not be empty.";
    } else if (confirmPasswordTextController.text.isEmpty) {
      return "Confirm Password not be empty.";
    } else if (passwordTextController.text.length < 8) {
      return "Password must be at least 8 characters in length.";
    } else if (confirmPasswordTextController.text.length < 8) {
      return "Confirm password must be at least 8 characters in length.";
    } else if (!isValidPassword.hasMatch(passwordTextController.text)) {
      return "Password should contain at least one upper case, lower case, one digit, Special character.";
    } else if (!isValidPassword.hasMatch(confirmPasswordTextController.text)) {
      return "Confirm password should contain at least one upper case, lower case, one digit, Special character.";
    } else if (confirmPasswordTextController.text !=
            passwordTextController.text ||
        passwordTextController.text != confirmPasswordTextController.text) {
      return "Passwords do not match.";
    } else {
      return '';
    }
  }

  static String handleEditProfileScreenError({
    fullNameTextController,
    initialsTextController,
  }) {
    if (fullNameTextController.text.isEmpty) {
      return "Full name not be empty.";
    } else if (initialsTextController.text.isEmpty) {
      return "Initials not be empty.";
    } else {
      return '';
    }
  }

  static String handleChangePasswordScreenError({
    currentPasswordTextController,
    newPasswordTextController,
    confirmPasswordTextController,
  }) {
    if (currentPasswordTextController.text.isEmpty) {
      return "Current Password not be empty.";
    } else if (newPasswordTextController.text.isEmpty) {
      return "New Password not be empty.";
    } else if (confirmPasswordTextController.text.isEmpty) {
      return "Confirm Password not be empty.";
    } else if (currentPasswordTextController.text.length < 8) {
      return "Current Password must be at least 8 characters in length.";
    } else if (newPasswordTextController.text.length < 8) {
      return "New Password must be at least 8 characters in length.";
    } else if (confirmPasswordTextController.text.length < 8) {
      return "Confirm password must be at least 8 characters in length.";
    } else if (!isValidPassword.hasMatch(currentPasswordTextController.text)) {
      return "Current Password should contain at least one upper case, lower case, one digit, Special character.";
    } else if (!isValidPassword.hasMatch(newPasswordTextController.text)) {
      return "New Password should contain at least one upper case, lower case, one digit, Special character.";
    } else if (!isValidPassword.hasMatch(confirmPasswordTextController.text)) {
      return "Confirm password should contain at least one upper case, lower case, one digit, Special character.";
    } else if (confirmPasswordTextController.text !=
            newPasswordTextController.text ||
        newPasswordTextController.text != confirmPasswordTextController.text) {
      return "Passwords do not match.";
    } else {
      return '';
    }
  }

  static String handleAddMemberScreenError({
    firstNameTextController,
    lastNameTextController,
    initialsTextController,
    selectedColor,
  }) {
    if (firstNameTextController.text.isEmpty) {
      return "First name not be empty.";
    } else if (lastNameTextController.text.isEmpty) {
      return "Last name not be empty.";
    } else if (initialsTextController.text.isEmpty) {
      return "Initials not be empty.";
    } else if (selectedColor == topButtonColor) {
      return "Please select initials color.";
    } else {
      return '';
    }
  }
}

RegExp isValidEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

RegExp isValidPassword =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
