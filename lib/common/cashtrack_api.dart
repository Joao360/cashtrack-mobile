import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:cashtrack/domain/model/user.dart';
import 'package:cashtrack/domain/model/root.dart';

const String API_ROOT = 'http://192.168.1.73:8000/';

class CashtrackAPI {
  static Root endpoints;

  static Future<Root> fetchRoot() async {
    final response = await http.get(API_ROOT);

    if (response.statusCode < 300) {
      return Root.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<User> login(username, password) async {
    if (endpoints == null || endpoints.signIn == null) {
      throw Exception('endpoints was mot initialized');
    }

    final response = await http.post(
      endpoints.signIn,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'username': username,
        'password': password
      }),
    );


    if (response.statusCode < 500) {
      var json = jsonDecode(response.body);
      if (response.statusCode < 300) {
        return User.fromJson(json['user']);
      }

      throw Exception(json);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<User> register(firstName, email, password) async {
    if (endpoints == null || endpoints.signIn == null) {
      throw Exception('endpoints was mot initialized');
    }

    final response = await http.post(
      endpoints.register,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'first_name': firstName,
        'email': email,
        'password': password
      }),
    );


    if (response.statusCode < 500) {
      var json = jsonDecode(response.body);
      if (response.statusCode < 300) {
        return User.fromJson(json);
      }

      throw Exception(json);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}