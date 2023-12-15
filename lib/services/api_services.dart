import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_base_url.dart';

class AuthApiServices {
  // Admin registration
  static getAdminRegistration(
      {fullName, email, password, userName, initials}) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/register');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
      "password": password.toString(),
      "userName": userName.toString(),
      "initials": initials.toString(),
      "fullName": fullName.toString(),
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: encoding)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      log('current api Data: ${response.body}');
      return response;
    } on TimeoutException catch (error) {
      log('A timeout occurred.: $error');
      return null;
    } on SocketException catch (error) {
      log('$error');
      return null;
    }
  }

  // Admin Login
  static getAdminLogin({
    email,
    password,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/login');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
      "password": password.toString(),
      "userType": "doctor",
      "lang": language.toString(), // can be en, de, es, fr, it
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: encoding)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      log('current api Data: ${response.body}');
      return response;
    } on TimeoutException catch (error) {
      log('A timeout occurred.: $error');
      return null;
    } on SocketException catch (error) {
      log('$error');
      return null;
    }
  }

  // Admin Enter Email In Forgot Password
  static getAdminEnterEmailInForgotPassword({
    email,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/password-recovery');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: encoding)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      log('current api Data: ${response.body}');
      return response;
    } on TimeoutException catch (error) {
      log('A timeout occurred.: $error');
      return null;
    } on SocketException catch (error) {
      log('$error');
      return null;
    }
  }

  // Admin Enter OTP In Forgot Password
  static getAdminEnterOTPInForgotPassword({
    email,
    opt,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/verify-code');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
      "code": opt.toString(),
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: encoding)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      log('current api Data: ${response.body}');
      return response;
    } on TimeoutException catch (error) {
      log('A timeout occurred.: $error');
      return null;
    } on SocketException catch (error) {
      log('$error');
      return null;
    }
  }



  // Admin Reset Password In Forgot Password
  static getAdminResetPasswordInForgotPassword({
    email,
    newPassword,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/reset-password');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
      "newPassword": newPassword.toString(),
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: encoding)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      log('current api Data: ${response.body}');
      return response;
    } on TimeoutException catch (error) {
      log('A timeout occurred.: $error');
      return null;
    } on SocketException catch (error) {
      log('$error');
      return null;
    }
  }

  ///  serviceCategories
// static getServiceCategories({token}) async {
//   final url = Uri.parse('${ApiBaseUrl.url}/category');
//   log('current api url: $url');
//
//   final headers = {
//     'Authorization': 'Bearer $token',
//     'X-Authorization':
//         'V3zotHlTKE1r6jyPV6Cmnjhk20bnK2lFcIa2RTL86O5JxToc3VX6VjoWRLDUM5fh'
//   };
//   log('current header data: $headers');
//
//   try {
//     http.Response response = await http
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(const Duration(seconds: 60), onTimeout: () {
//       throw TimeoutException(
//           'The connection has timed out, Please try again!');
//     });
//     return response;
//   } on TimeoutException catch (error) {
//     log('A timeout occurred.: $error');
//   } on SocketException catch (error) {
//     log('SocketException SocketException: $error');
//     return null;
//   }
// }
}
