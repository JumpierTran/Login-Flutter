import 'package:camera_app/auth/Bloc/BLoc_State_login.dart';
import 'package:camera_app/auth/Bloc/BLoc_event_login.dart';
import 'package:camera_app/auth/Bloc/BLoc_login.dart';
import 'package:camera_app/auth/form_submission_status.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  // final loginBloc = BlocProvider.of<LoginBloc>(context);
  final api = BaseService();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    String phone = phoneController.text;
    String password = passwordController.text;
    if (phone.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Vui lòng nhập số điện thoại và mật khẩu không để trống',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    } else {
      Navigator.pushNamed(context, '/images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.lightBlue,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state.formStatus is FormSubmitting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.formStatus is SubmisssionSuccess) {
              return Center(
                child: Text('Đăng nhập thành công'),
              );
            } else if (state.formStatus is SubmisssionFailed) {
              final errorMessage =
                  (state.formStatus as SubmisssionFailed).exception.toString();
              return Center(
                child: Text('Đăng nhạp thất bại: $errorMessage'),
              );
            }
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
                        SizedBox(height: 30),
                        _passwordField(),
                        SizedBox(height: 30),
                        _buttonlogin(),
                        SizedBox(height: 30),
                        Row(
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
                        )
                      ],
                    ),
                  ),
                ))
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _phoneField() {
    return TextFormField(
      onChanged: (value) {
        LoginBloc().add(LoginPhoneChanged(value));
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
          labelStyle: TextStyle(color: Colors.black)),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      onChanged: (value) {
        LoginBloc().add(LoginPasswordChanged(value));
      },
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          labelText: 'Mật khẩu',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
          labelStyle: TextStyle(color: Colors.black)),
    );
  }

  Widget _buttonlogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          onPressed: () {
            LoginBloc().add(LoginSubmitted());
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
}
