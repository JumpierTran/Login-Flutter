import 'package:shared_preferences/shared_preferences.dart';

class Store {
  const Store._();

  static const String _tokenKeY = "TOKEN";

  static Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKeY, token);
  }

  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKeY);
  }

  static Future<void> clear() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.clear();
  }
}
