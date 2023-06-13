import 'package:camera_app/auth/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  late SharedPreferences prefs;
  AuthModel? authModel;

  static final Global _instance = Global._internal();

  factory Global() {
    return _instance;
  }

  Global._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    final saveSession = prefs.getString('session');
    if (saveSession != null) {
      authModel?.session =
          Session.fromJson('saveSession' as Map<String, dynamic>);
    }
  }

  Future<void> saveSession(Session session) async {
    authModel?.session = session;
    await prefs.setString('session', session.toJson() as String);
  }

  Future<void> clearSession() async {
    authModel?.session = null;
    await prefs.remove('session');
  }
}
