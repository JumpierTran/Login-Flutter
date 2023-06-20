import 'package:camera_app/auth/Bloc/login/bloc_login.dart';
import 'package:camera_app/core/global.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/routes/router.dart';
import 'package:provider/provider.dart';
import 'package:camera_app/service/sessionmanager.dart';

var _token = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager().initialze();
  _token = SessionManager().getSessionKey() ?? "";
  Global.session = _token;

  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    RouterFluro.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBLoc>(create: (context) => LoginBLoc(BaseService()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: _token != "" ? "dash" : '/login',
        onGenerateRoute: RouterFluro.fluroRouter.generator,
      ),
    );
  }
}
