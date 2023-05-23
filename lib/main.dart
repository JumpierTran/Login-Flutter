import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(loginPage());
}

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Login',
      home: homeLoginPage(),
    );
  }
}

class homeLoginPage extends StatelessWidget {
  homeLoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 36, 211, 211),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Icon(
                Icons.lock,
                size: 80,
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome\'s back. We\'re missing so much!',
                style: TextStyle(
                    color: Color.fromARGB(211, 60, 250, 60), fontSize: 16),
              ),
              const SizedBox(height: 30),
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              ForgotPassword(),
              const SizedBox(height: 10),
              MyButton(ontap: signInUser),
              const SizedBox(height: 10),
              SignInWith(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinkSignin(
                      namePath:
                          'D:\\Flutter\\test_2\\Project_AppByCam\\project\\assets\\image\\imageFacebook.png'),
                  const SizedBox(width: 20),
                  LinkSignin(
                      namePath:
                          'D:\\Flutter\\test_2\\Project_AppByCam\\project\\assets\\image\\imageGoogle.png'),
                  const SizedBox(width: 20),
                  LinkSignin(
                      namePath:
                          'D:\\Flutter\\test_2\\Project_AppByCam\\project\\assets\\image\\imageInstagram.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 255, 128)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 18, 245, 226)),
          ),
          fillColor: Color.fromARGB(255, 166, 243, 204),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.ontap});

  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(18.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            "Sign in",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SignInWith extends StatelessWidget {
  const SignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Or sign in with',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class LinkSignin extends StatelessWidget {
  final String namePath;

  const LinkSignin({super.key, required this.namePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white),
      child: Image.asset(
        namePath,
        height: 60,
      ),
    );
  }
}
