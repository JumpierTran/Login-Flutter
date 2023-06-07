import 'package:flutter/material.dart';
import 'package:signin_signup_ui/signUp.dart';

class FormSignIn extends StatelessWidget {
  const FormSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: SignIn(),
    );
  }
}

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Chào mừng bạn quay trở lại, \nhãy đăng nhập để được sử dụng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextBox(
                  controller: usernameController,
                  obscureText: false,
                  labelText: 'Số điện thoại',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextBox(
                  controller: passwordController,
                  labelText: 'Mật khẩu',
                  obscureText: true,
                ),
                const SizedBox(height: 6),
                const MyTextButton(),
                const SizedBox(height: 10),
                const MyButton(
                  buttonText: 'Đăng nhập',
                  buttonClick: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                const MyButton(
                  buttonText: 'Đăng ký',
                  buttonClick: true,
                ),
                const SizedBox(
                  height: 100,
                ),
                const MyText(
                  textPolicy: 'Điều khoản sử dụng và chính sách bảo mật',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  final String buttonText;
  final bool buttonClick;
  const MyButton({
    super.key,
    required this.buttonText,
    required this.buttonClick,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  void toggleButton() {
    if (widget.buttonClick == true) {
      MaterialPageRoute(builder: (context) => const FormSignUp());
    } else {
      MaterialPageRoute(builder: (context) => const FormSignUp());
    }
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: const Color.fromARGB(255, 77, 237, 252),
    minimumSize: const Size(300, 60),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: raisedButtonStyle,
      child: Text(
        widget.buttonText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        toggleButton();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FormSignUp()),
        );
      },
    );
  }
}

class MyText extends StatelessWidget {
  final String textPolicy;

  const MyText({super.key, required this.textPolicy});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            minimumSize: const Size(88, 30),
          ),
          onPressed: () {},
          child: Text(
            textPolicy,
          ),
        ),
      ],
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle textButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.blue,
      minimumSize: const Size(88, 30),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextButton(
        style: textButtonStyle,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              'Quên mật khẩu ?',
            ),
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final bool obscureText;
  final String labelText;

  const TextBox({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.blueAccent[100],
          filled: true,
          labelText: labelText,
        ),
      ),
    );
  }
}

void main() {
  runApp(const FormSignIn());
}
