import 'package:camera_app/service/api.dart';
import 'package:camera_app/service/apiAuth.dart';
import 'package:flutter/material.dart';

class homeSignUp extends StatefulWidget {
  homeSignUp({super.key});

  @override
  State<homeSignUp> createState() => _homeSignUpState();
}

class _homeSignUpState extends State<homeSignUp> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController retypepasswordController =
      TextEditingController();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  void handleRegister() async {
    ApiAuth().setupInterceptors();
    try {
      if (_formkey.currentState!.validate()) {
        String address = addressController.text;
        String fullname = fullNameController.text;
        String password = passwordController.text;
        String retypePassword = password;
        String phone = phoneController.text;
        await ApiAuth().register(
            address: address,
            fullname: fullname,
            password: password,
            retypePassword: retypePassword,
            phone: phone);
      } else {}
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đăng ký',
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
              const SizedBox(height: 30),
              Text(
                'Hãy đăng ký tại đây 👇!',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
              const SizedBox(height: 20),
              MyNumberField(
                  controller: phoneController,
                  hintText: 'Số điện thoại',
                  obscureText: false),
              const SizedBox(height: 20),
              MyTextField(
                  controller: passwordController,
                  hintText: 'Mật Khẩu',
                  obscureText: true),
              const SizedBox(height: 20),
              MyTextField(
                  controller: retypepasswordController,
                  hintText: 'Nhập lại mật khẩu',
                  obscureText: true),
              const SizedBox(height: 20),
              MyTextField(
                  controller: fullNameController,
                  hintText: 'Họ và Tên',
                  obscureText: false),
              const SizedBox(height: 20),
              MyTextField(
                  controller: addressController,
                  hintText: 'Địa Chỉ',
                  obscureText: false),
              const SizedBox(height: 20),
              ButtonPressed(onPress: handleRegister),
              const SizedBox(height: 10),
              SignUpWith(),
              const SizedBox(height: 10),
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
      )),
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
      child: TextField(
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

class ButtonPressed extends StatelessWidget {
  ButtonPressed({super.key, required this.onPress});
   VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          onPress = onPress;
          Navigator.pushNamed(context, "/");
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

class SignUpWith extends StatelessWidget {
  const SignUpWith({super.key});

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
              'Hoặc đăng ký với',
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
