import 'package:camera_app/bloc/listcamera/listcamera_bloc.dart';
import 'package:camera_app/bloc/login/bloc_login.dart';
import 'package:camera_app/bloc/register/bloc_register.dart';
import 'package:camera_app/core/global.dart';
import 'package:camera_app/page/register.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/routes/router.dart';
import 'package:camera_app/service/sessionmanager.dart';
import 'package:provider/provider.dart';

var _token = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.initialize();
  _token = await SessionManager.getSession() ?? "";
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
        Provider<LoginBLoc>(create: (_) => LoginBLoc()),
        Provider<RegisterBloc>(create: (_) => RegisterBloc()),
        Provider<ListCameraBloc>(create: (_) =>ListCameraBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: _token.isNotEmpty ? "/dashboard" : '/login',
        onGenerateRoute: RouterFluro.fluroRouter.generator,
        home: HomeRegisterPage(key: UniqueKey()),
      ),
    );
  }
}
