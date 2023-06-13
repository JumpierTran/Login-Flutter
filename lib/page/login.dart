import 'package:camera_app/auth/Bloc/login/event_login.dart';
import 'package:camera_app/auth/Bloc/login/state_login.dart';
import 'package:camera_app/auth/Bloc/login/bloc_login.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isPasswordVisible = false;
  final api = BaseService();
  late LoginBLoc loginBLoc;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initialzeLoginBloc() async {
    super.initState();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    loginBLoc = LoginBLoc(sharedPreferences);
    loginBLoc.initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBLoc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(context, '/images');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.lightBlue, Colors.cyanAccent],
              ),
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: BlocBuilder<LoginBLoc, LoginState>(
                    builder: (context, state) {
                  return Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 45, top: 150),
                        child: Text(
                          'Chào mừng \n  đến với \n     VSHOME 📸',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
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
                  );
                }))));
  }

  Widget _phoneField() {
    return TextFormField(
      onChanged: (value) {
        print('Số điện thoại thay đổi: $value');
      },
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
      onChanged: (value) {
        print('Mật khẩu thay đổi: $value');
      },
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
          onPressed: () {
            //Login here
            String phone = phoneController.text;
            String password = passwordController.text;
            if (phone.isEmpty || password.isEmpty) {
              Fluttertoast.showToast(
                  msg: 'Số điện thoại hoặc mật khẩu để trống hãy nhập lại',
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 14);
            } else {
              context
                  .read<LoginBLoc>()
                  .add(LoginButtonPressed(phone, password));
            }
          },
          child: Text('Đăng nhập',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black,
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
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
          child: Text('Đăng ký tại đây',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: Colors.black87)),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Quên Mật khẩu',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  color: Colors.black87)),
        ),
      ],
    );
  }

  Widget _buttonPolicy() {
    return Center(
      child: TextButton(
          onPressed: () {
            // we will developer function in the future
          },
          child: Text('Chính sách bảo mật',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                // decoration: TextDecoration.underline
              ))),
    );
  }
}
