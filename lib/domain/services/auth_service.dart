import 'dart:convert';
import 'dart:io';
import 'package:cashtrack/domain/model/user.dart';
import 'package:http/http.dart' as http;

Future<User> login(username, password) async {
  final response = await http.post(
    Uri.https('jsonplaceholder.typicode.com', 'albums'),
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