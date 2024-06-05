import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base_url.dart';
import '../models/exercise_model.dart';
import '../models/user_model.dart';
import '../models/login_response_model.dart';

class ApiService {
  static Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(User(email: email, password: password).toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<LoginResponse> register(String email, String password) async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(User(email: email, password: password).toJson()),
    );

    if (response.statusCode == 201) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }

  static Future<Exercise> getExerciseDetail(int id) async {
    final url = Uri.parse('$baseUrl/exercises/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Exercise.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load exercise detail');
    }
  }

  static Future<List<Exercise>> getExercises() async {
    final url = Uri.parse('$baseUrl/exercises');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Exercise.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load exercises');
    }
  }
}
