import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_base_url.dart';

class AuthApiServices {
  // Admin registration
  static getAdminRegistration({
    fullName,
    email,
    password,
    userName,
    initials,
    language,
  }) async {
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
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/password-recovery');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
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

  // Admin Enter OTP In Forgot Password
  static getAdminEnterOTPInForgotPassword({
    email,
    opt,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/verify-code');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
      "code": opt.toString(),
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

  // Admin Reset Password In Forgot Password
  static getAdminResetPasswordInForgotPassword({
    email,
    newPassword,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/reset-password');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "email": email.toString(),
      "newPassword": newPassword.toString(),
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

  // Member Login
  static getMemberLogin({
    enrollmentCode,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/login');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "userType": "team-member",
      "enrollmentCode": enrollmentCode.toString(),
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
}

class SubscriptionApiServices {
  // subscription
  static getSubscription({
    token,
    isSubscribed,
    code,
    expiry,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/subscription');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "isSubscribed": isSubscribed,
      "code": code,
      "expiry": expiry,
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
}

class MembersApiServices {
  // Add member in team
  static getAddMemberInTeam({
    token,
    firstName,
    lastName,
    initials,
    color,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group-member');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "firstName": firstName.toString(),
      "lastName": lastName.toString(),
      "initials": initials.toString(),
      "type": 'team',
      "color": color.toString(),
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
}

class GroupApiServices {
  // create group
  static createGroup({
    token,
    groupName,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "name": groupName.toString(),
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

  //  get Groups
  static getGroups({
    token,
    language,
  }) async {
    final url =
        Uri.parse('${ApiBaseUrl.url}/user/group/get-all-groups/$language');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .get(
        url,
        headers: headers,
      )
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

  // edit group name
  static editGroupName({
    token,
    groupName,
    groupId,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group/edit');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "name": groupName.toString(),
      "id": groupId.toString(),
      "lang": language.toString(), // can be en, de, es, fr, it
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .patch(url, headers: headers, body: jsonBody, encoding: encoding)
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

  // Add members in group
  static addMembersInGroup({
    token,
    firstName,
    lastName,
    initials,
    color,
    groupId,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group-member');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "firstName": firstName.toString(),
      "lastName": lastName.toString(),
      "initials": initials.toString(),
      "type": 'group',
      "color": color.toString(),
      "group": groupId.toString(),
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

  //  get members in Group
  static getMembersInGroup(
    language, {
    token,
    groupId,
  }) async {
    final url =
        Uri.parse('${ApiBaseUrl.url}/user/group-member/$groupId/all/$language');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .get(
        url,
        headers: headers,
      )
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

  // Delete  member
  static deleteMember({
    token,
    teamMemberId,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group-member/delete');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "teamMember": teamMemberId,
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .delete(url, headers: headers, body: jsonBody, encoding: encoding)
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

  // Delete group
  static deleteGroup({
    token,
    groupId,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group/delete/$groupId');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .delete(
        url,
        headers: headers,
      )
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

  // edit member status
  static editMemberStatus({
    token,
    teamMemberId,
    blockedStatus,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group-member/status');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "teamMember": teamMemberId.toString(),
      "status": blockedStatus.toString(),
      "lang": language.toString(), // can be en, de, es, fr, it
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .patch(url, headers: headers, body: jsonBody, encoding: encoding)
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

  //  get members in Team
  static getMembersInTeam(
    defaultTeam,
    language, {
    token,
  }) async {
    final url = Uri.parse(
        '${ApiBaseUrl.url}/user/group-member/$defaultTeam/all/$language');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .get(
        url,
        headers: headers,
      )
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

  // edit member profile
  static editMemberProfile({
    token,
    teamMemberId,
    fullName,
    initials,
    initialsColor,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/group-member/edit');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "teamMember": teamMemberId.toString(),
      "fullName": fullName.toString(),
      "initials": initials.toString(),
      "color": initialsColor.toString(),
      "lang": language.toString(), // can be en, de, es, fr, it
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .patch(url, headers: headers, body: jsonBody, encoding: encoding)
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
}

class ProfileApiServices {
  //  get admin profile
  static getAdminProfile(
    language, {
    token,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/my-profile/get/$language');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .get(
        url,
        headers: headers,
      )
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

  // Admin Change Password
  static adminChangePassword({
    token,
    currentPassword,
    newPassword,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/change-password');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "currentPassword": currentPassword.toString(),
      "newPassword": newPassword.toString(),
      "lang": language.toString(), // can be en, de, es, fr, it
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .put(url, headers: headers, body: jsonBody, encoding: encoding)
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

  //  get admin profile
  static getAdminAddNewMessage({
    token,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/predefinedmessage');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .get(
        url,
        headers: headers,
      )
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

  // Admin Add New Message
  static adminAddNewMessage({
    token,
    textOfMessage,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/predefinedmessage');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "text": textOfMessage.toString(),
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

  // Admin Edit Profile
  static adminEditProfile({
    token,
    fullName,
    initials,
    color,
    language,
  }) async {
    final url = Uri.parse('${ApiBaseUrl.url}/user/my-profile/edit');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, dynamic> body = {
      "fullName": fullName.toString(),
      "initials": initials.toString(),
      "color": color.toString(),
      "lang": language.toString(), // can be en, de, es, fr, it
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .put(url, headers: headers, body: jsonBody, encoding: encoding)
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

  //  get Member profile
  static getMemberProfile(
    language, {
    token,
  }) async {
    final url =
        Uri.parse('${ApiBaseUrl.url}/user/member/my-profile/get/$language');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .get(
        url,
        headers: headers,
      )
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

  // Member logout
  static memberLogout({
    token,
    language,
  }) async {
    final url =
        Uri.parse('${ApiBaseUrl.url}/user/group-member/logout?lang=$language');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      http.Response response = await http
          .patch(
        url,
        headers: headers,
      )
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
}
