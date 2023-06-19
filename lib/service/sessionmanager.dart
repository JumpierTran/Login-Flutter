import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  late SharedPreferences _prefs;

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  Future<void> initialze() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getSessionKey() {
    return _prefs.getString('Session-Key');
  }

  Future<void> setSessionKey(String sessionKey) async {
    await _prefs.setString('Session-Key', sessionKey);
  }

  Future<void> clearSessionKey() async {
    await _prefs.remove('Session-Key');
  }
}
