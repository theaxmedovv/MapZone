import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static String? _token;
  static const String _tokenKey = 'token';

  /// Save token both in-memory and in persistent storage
  static Future<void> saveToken(String token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  /// Get token from memory if available, otherwise from persistent storage
  static Future<String?> getToken() async {
    if (_token != null) return _token;
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_tokenKey);
    return _token;
  }

  /// Clear token from both memory and persistent storage
  static Future<void> clear() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
