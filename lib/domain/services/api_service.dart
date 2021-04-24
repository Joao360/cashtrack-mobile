import 'package:cashtrack/domain/model/root.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_ROOT = 'http://localhost:8000/';

class ApiService {
  Root root;

  Future<Root> fetchRoot() async {
    final response = await http.get(API_ROOT);

    if (response.statusCode == 200) {
      root = Root.fromJson(jsonDecode(response.body));
      this.root = root;
      return this.root;
    } else {
      throw Exception('Failed to load api root');
    }
  }
}

