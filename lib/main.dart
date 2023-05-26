import 'package:flutter/material.dart';
import 'package:camera_app/routes/router.dart';

void main() {
  runApp(loginPage());
}

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  initState() {
    super.initState();
    RouterFluro.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: homeLoginPage(),
      initialRoute: '/',
      onGenerateRoute: RouterFluro.fluroRouter.generator,
    );
  }
}
