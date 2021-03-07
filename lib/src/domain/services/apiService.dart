import 'package:cashtrack/src/domain/dtos/RootDTO.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String api = 'http://localhost:8000/';

class ApiService {
  RootDTO root;

  Future<RootDTO> fetchRoot() async {
    final response = await http.get(api);

    if (response.statusCode == 200) {
      root = RootDTO.fromJson(jsonDecode(response.body));
      this.root = root;
      return this.root;
    } else {
      throw Exception('Failed to load api root');
    }
  }
}

