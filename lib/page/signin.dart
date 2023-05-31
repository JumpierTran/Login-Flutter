import 'package:camera_app/auth/authBloc.dart';
import 'package:camera_app/page/CameraPage.dart';
import 'package:camera_app/page/signup.dart';
import 'package:camera_app/service/apiAuth.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/service/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeLoginPage extends StatefulWidget {
  homeLoginPage({super.key});

  @override
  State<homeLoginPage> createState() => _homeLoginPageState();
}

class _homeLoginPageState extends State<homeLoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    ApiAuth().setupInterceptors();
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
    }
    try {
      String phone = phoneController.text;
      String password = passwordController.text;
      await ApiAuth().login(phone: phone, password: password);
      print('$phone and $password');
    } catch (e) {
      print('Đã xảy ra lỗi đăng nhập: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "/signup");
          },
        ),
        title: Text(
          'Đăng nhập',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Hãy đăng nhập xem camera của bạn😍👇',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
                const SizedBox(height: 30),
                MyNumberField(
                  controller: phoneController,
                  hintText: 'Số điện thoại',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Mật khẩu',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ForgotPassword(),
                const SizedBox(height: 10),
                //Nút đăng nhập
                ButtonPressed(onPress: handleLogin),
                const SizedBox(height: 10),
                SignInWith(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinkSignin(namePath: 'assets/image/imageFacebook.png'),
                    const SizedBox(width: 20),
                    LinkSignin(namePath: 'assets/image/imageGoogle.png'),
                    const SizedBox(width: 20),
                    LinkSignin(namePath: 'assets/image/imageInstagram.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
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
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập mật khẩu';
          }
          return null;
        },
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 41, 140, 222)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 92, 142, 230)),
          ),
          fillColor: Color.fromARGB(255, 76, 119, 164),
          filled: true,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}

class MyNumberField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyNumberField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<MyNumberField> createState() => _MyNumberFieldState();
}

class _MyNumberFieldState extends State<MyNumberField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập lại số điện thoại';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 41, 140, 222)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 92, 142, 230)),
          ),
          fillColor: Color.fromARGB(255, 76, 119, 164),
          filled: true,
          hintText: widget.hintText,
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
            'Quên mật khẩu?',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          )
        ],
      ),
    );
  }
}

class ButtonPressed extends StatelessWidget {
  ButtonPressed({super.key, required this.onPress});
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          onPress = onPress;

          Navigator.pushNamed(context, "/devices");
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(365, 50),
            backgroundColor: Color.fromARGB(255, 36, 69, 92),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text('Đăng nhập'),
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
              'Hoặc đăng nhập với',
              style: TextStyle(fontSize: 12),
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
