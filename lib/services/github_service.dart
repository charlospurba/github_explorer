import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/repository.dart';
import '../models/user.dart';

class GithubService {
  static const String _baseUrl = 'https://api.github.com';

  static Future<User> getUser(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/user'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<List<Repository>> getRepositories(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/user/repos'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Repository.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
