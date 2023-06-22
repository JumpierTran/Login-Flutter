import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String sessionKey = 'session';
  static SharedPreferences? _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<String?> getSession() async {
    if (_prefs == null) {
      await initialize();
    }
    return _prefs!.getString(sessionKey);
  }

  static Future<void> setSession(String session) async {
    if (_prefs == null) {
      await initialize();
    }
    await _prefs!.setString(sessionKey, session);
  }

  static Future<void> clearSession() async {
    if (_prefs == null) {
      await initialize();
    }
    await _prefs!.remove(sessionKey);
  }
}
