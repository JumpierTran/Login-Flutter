import 'package:camera_app/bloc/login/bloc_login.dart';
import 'package:camera_app/bloc/login/event_login.dart';
import 'package:camera_app/bloc/login/state_login.dart';
import 'package:camera_app/core/constpublic.dart';
import 'package:camera_app/page/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLoginPage extends StatefulWidget {
  HomeLoginPage({super.key});

  @override
  State<HomeLoginPage> createState() => _HomeLoginPageState();
}

class _HomeLoginPageState extends State<HomeLoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [
        //       Colors.blue,
        //       Colors.cyan,
        //       Colors.greenAccent,
        //     ],
        //   ),
        // ),
        color: Colors.white,
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
                        SizedBox(height: 10),
                        _buttonRegister(),
                        SizedBox(height: 10),
                        _buttonPolicy(),
                      ],
                    ),
                  ),
                ))
              ],
            )));
  }

  Widget _phoneField() {
    return BlocConsumer<LoginBLoc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMesage)));
        }
      },
      builder: (context, state) {
        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Số điện thoại tài khoản không được rỗng";
            }
            return null;
          },
          onChanged: (value) {
            context.read<LoginBLoc>().add(PhoneEvent(phone: value));
          },
          keyboardType: TextInputType.number,
          controller: phoneController,
          decoration: InputDecoration(
            fillColor: Colors.white10,
            filled: true,
            labelText: 'Số điện thoại',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelStyle: ConstPublic.inputTextFormField,
          ),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocConsumer<LoginBLoc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Mật khẩu không dược rỗng";
            }
            return null;
          },
          onChanged: (value) {
            context.read<LoginBLoc>().add(PasswordEvent(password: value));
          },
          controller: passwordController,
          obscureText: isPasswordVisible,
          decoration: InputDecoration(
            fillColor: Colors.white10,
            filled: true,
            labelText: 'Mật khẩu',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelStyle: ConstPublic.inputTextFormField,
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
      },
    );
  }

  Widget _buttonlogin() {
    return BlocConsumer<LoginBLoc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMesage)));
        } else if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, "/dashboard");
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed:state is LoginLoading ? null : () async {
            //Login here
            if(_formkey.currentState!.validate()){
            print('Số điện thoại ${phoneController.text}');
            print('Mật khẩu là ${passwordController.text}');
            context.read<LoginBLoc>().add(LoginButtonPressed(
                phoneController.text, passwordController.text
                  )
                );
             }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shadowColor: MaterialStateProperty.all<Color>(Colors.grey)),
          child:state is LoginLoading ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
          ) : Text('Đăng nhập', style: ConstPublic.buttonFontStyle,),
        );
      },
    );
  }

  Widget _buttonRegister() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeRegisterPage(key: UniqueKey())));
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: Text('Đăng ký tại đây', style: ConstPublic.buttonOtherStyle),
    );
  }

  Widget _buttonPolicy() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Chính sách bảo mật',
          style: TextStyle(
              fontSize: 20,
              color: Colors.blue.withOpacity(0.5),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold
              // decoration: TextDecoration.underline
              ),
        ),
      ),
    );
  }
}
