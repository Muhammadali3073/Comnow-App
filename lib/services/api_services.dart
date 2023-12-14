import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_base_url.dart';

class AuthApiServices {
  // register
  static getRegistration(
      {name, email, password, passwordConfirmation, contactNo, cityKey}) async {
    final url = Uri.parse('${ApiBaseUrl.url}/register');
    log('current api url: $url');

    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      "name": "$name",
      "email": "$email",
      "password": "$password",
      "password_confirmation": "$passwordConfirmation",
      "contact_no": "$contactNo",
      "location": "$cityKey",
      "reffered_by": ""
    };

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    log('current api JsonBody: $jsonBody');

    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: encoding)
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      return response;
    } on TimeoutException catch (error) {
      log('A timeout occurred.: $error');
    } on SocketException catch (error) {
      log('SocketException SocketException: $error');
    }
  }

  ///  serviceCategories
  static getServiceCategories({token}) async {
    final url = Uri.parse('${ApiBaseUrl.url}/category');
    log('current api url: $url');

    final headers = {
      'Authorization': 'Bearer $token',
      'X-Authorization':
          'V3zotHlTKE1r6jyPV6Cmnjhk20bnK2lFcIa2RTL86O5JxToc3VX6VjoWRLDUM5fh'
    };
    log('current header data: $headers');

    try {
      http.Response response = await http
          .get(
        url,
        headers: headers,
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      return response;
    } on TimeoutException catch (error) {
      log('A timeout occurred.: $error');
    } on SocketException catch (error) {
      log('SocketException SocketException: $error');
      return null;
    }
  }
}
