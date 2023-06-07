import 'package:flutter/material.dart';
import 'package:signin_signup_ui/signIn.dart';

final address = TextEditingController();
final fullname = TextEditingController();
final password = TextEditingController();
final phone = TextEditingController();

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignUp(),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 46, 178, 255),
          title: const Text(
            'Đăng ký',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormSignIn()),
                );
              },
              icon: const Icon(Icons.home),
            ),
          ],
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const TextSignUp(),
                  const SizedBox(
                    height: 50,
                  ),
                  TextBox(
                    controller: address,
                    labelText: 'Địa chỉ',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    controller: fullname,
                    labelText: 'Họ và tên',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    controller: password,
                    labelText: 'Mật khẩu',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    controller: phone,
                    labelText: 'Số điện thoại',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const MyButton(
                    buttonText: 'Đăng ký',
                    buttonClick: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextSignUp extends StatelessWidget {
  const TextSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Mời bạn nhập thông tin để đăng ký tài khoản',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

void main() {
  runApp(const FormSignUp());
}
