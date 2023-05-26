import 'package:flutter/material.dart';
import 'package:camera_app/service/api.dart';

class homeLoginPage extends StatefulWidget {
  homeLoginPage({super.key});

  @override
  State<homeLoginPage> createState() => _homeLoginPageState();
}

class _homeLoginPageState extends State<homeLoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // var api = DemoApi();

  void _login(BuildContext context) {
    String phone = phoneController.text;
    String password = passwordController.text;

    // login(phone, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "signup");
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
                MyButton(
                  ontap: () {
                    //  _login(context);
                    fetchData();
                  },
                ),
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
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 41, 140, 222)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 92, 142, 230)),
          ),
          fillColor: Color.fromARGB(255, 76, 119, 164),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}

class MyNumberField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 41, 140, 222)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 92, 142, 230)),
          ),
          fillColor: Color.fromARGB(255, 76, 119, 164),
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
        mainAxisAlignment: MainAxisAlignment.center,
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
          child: Column(
            children: [
              Text(
                "Đăng nhập",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
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
              'Hoặc đăng nhập với',
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
