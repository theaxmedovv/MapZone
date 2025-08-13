import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/config.dart';

class AuthService {
  static Future<String> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$apiBase/api/Auth/register');
    final resp = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'email': email,
      }),
    );

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      // Adjust if your backend returns different shape
      final token = (data['token'] ?? data['accessToken']) as String?;
      if (token == null) {
        throw Exception('Token missing in response');
      }
      return token;
    }

    // Bubble up backend error text for SnackBar
    throw Exception('Registration failed (${resp.statusCode}): ${resp.body}');
  }
}
