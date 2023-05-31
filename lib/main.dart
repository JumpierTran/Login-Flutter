import 'package:flutter/material.dart';
import 'package:camera_app/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
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
      initialRoute: '/',
      onGenerateRoute: RouterFluro.fluroRouter.generator,
    );
  }
}
