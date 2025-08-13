import 'dart:convert';
import 'package:http/http.dart' as http;

/// Simple API client for Auth endpoints.
class ApiClient {
  // ❗ Choose the right base URL for your environment:
  // Android Emulator: http://10.0.2.2:5212
  // iOS Simulator:    http://localhost:5212
  // Real device:      http://<YOUR-PC-IP>:5212
  // Web browser:      http://localhost:5212
  static const String _baseUrl = 'http://localhost:5212';

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/Auth/login');

    final resp = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (resp.statusCode == 200) {
      final map = jsonDecode(resp.body) as Map<String, dynamic>;
      final token = map['token'] as String?;
      if (token == null || token.isEmpty) {
        throw Exception('Token missing in response');
      }
      return token;
    } else {
      // surface API error text if any
      String message = 'Login failed (${resp.statusCode})';
      try {
        final map = jsonDecode(resp.body);
        if (map is Map && map['message'] is String) {
          message = map['message'];
        }
      } catch (_) {}
      throw Exception(message);
    }
  }
}