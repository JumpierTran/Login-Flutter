import 'package:camera_app/core/constpublic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeLoginPage extends StatefulWidget {
  HomeLoginPage({super.key});

  @override
  State<HomeLoginPage> createState() => _HomeLoginPageState();
}

class _HomeLoginPageState extends State<HomeLoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showErrorMessage = true;
  bool isPasswordVisible = true;
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.lightBlue, Colors.cyanAccent],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 45, top: 130),
                  child: Text(
                    'Hãy đăng nhập tại đây 👇📸',
                    style: ConstPublic.titleFontStyle,
                  ),
                ),
                SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                      right: 35,
                      left: 35),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        _phoneField(),
                        SizedBox(height: 20),
                        _passwordField(),
                        SizedBox(height: 20),
                        _buttonlogin(),
                        SizedBox(height: 20),
                        _buttonRegisterandForgetPassword(),
                        SizedBox(
                          height: 20,
                        ),
                        _buttonPolicy()
                      ],
                    ),
                  ),
                ))
              ],
            )));
  }

  Widget _phoneField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: phoneController,
      decoration: InputDecoration(
        fillColor: Colors.white10,
        filled: true,
        labelText: 'Số điện thoại',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
        fillColor: Colors.white10,
        filled: true,
        labelText: 'Mật khẩu',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
        labelStyle: TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        alignLabelWithHint: false,
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buttonlogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          onPressed: () async {
            //Login here
            print('Số điện thoại ${phoneController.text}');
            print('Mật khẩu là ${passwordController.text}');
            
          },
          child: Text('Đăng nhập', style: ConstPublic.buttonFontStyle),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black,
          child: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/register');
              },
              icon: Icon(Icons.arrow_forward)),
        )
      ],
    );
  }

  Widget _buttonRegisterandForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text('Đăng ký tại đây', style: ConstPublic.buttonOtherStyle),
        ),
        TextButton(
          onPressed: () {
            //This page and function will be developed in the future
            Fluttertoast.showToast(
                msg: 'Chức năng này hiện đang phát triển chưa ra mắt',
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 14);
          },
          child: Text('Quên Mật khẩu', style: ConstPublic.buttonOtherStyle),
        ),
      ],
    );
  }

  Widget _buttonPolicy() {
    return Center(
      child: TextButton(
        onPressed: () {
          // This page and function will be developed in the future
          Fluttertoast.showToast(
              msg: 'Chức năng đang phát triển hiện chưa ra mắt',
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 14);
        },
        child: Text(
          'Chính sách bảo mật',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500
              // decoration: TextDecoration.underline
              ),
        ),
      ),
    );
  }
}
