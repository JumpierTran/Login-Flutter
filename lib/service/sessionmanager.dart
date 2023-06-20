import 'package:camera_app/auth/auth_model.dart';
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
    return _prefs.getString('SessionKey');
  }

  Future<void> setSessionKey(String sessionKey) async {
    await _prefs.setString('SessionKey', sessionKey);
  }

  Future<void> clearSessionKey() async {
    await _prefs.remove('SessionKey');
  }

  Future<void> saveSessionKeyFormAuthModel(AuthModel authModel) async {
    final sessionKey = authModel.session!.key;
    if (sessionKey != null) {
      await setSessionKey(sessionKey);
    }
  }
}
