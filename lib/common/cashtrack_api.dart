import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:cashtrack/domain/model/user.dart';
import 'package:cashtrack/domain/model/root.dart';

const String API_ROOT = 'http://192.168.1.73:8000/';

class CashtrackAPI {
  static Future<Root> fetchRoot() async {
    final response = await http.get(API_ROOT);

    if (response.statusCode < 300) {
      return Root.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load api root: ' + response.reasonPhrase);
    }
  }

  static Future<User> login(username, password) async {
    // TODO finish login

    final response = await http.post(
      Uri.https('', ''),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'username': username,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}