import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base_url.dart';

class ApiService {
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<Map<String, dynamic>> register(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  static Future<Map<String, dynamic>> getExerciseDetail(int id) async {
    final url = Uri.parse('$baseUrl/exercises/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load exercise detail');
    }
  }

  static Future<List<dynamic>> getExercises() async {
    final url = Uri.parse('$baseUrl/exercises');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load exercises');
    }
  }
}
