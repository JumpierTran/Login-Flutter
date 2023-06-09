import 'package:camera_app/Bloc/BLoc_login.dart';
import 'package:camera_app/service/BaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeLoginPage extends StatefulWidget {
  HomeLoginPage({super.key});

  @override
  State<HomeLoginPage> createState() => _HomeLoginPageState();
}

class _HomeLoginPageState extends State<HomeLoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showErrorMessage = true;
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
    return Container(
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
        body: Stack(
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
              child: Builder(
                builder: (context) =>BlocProvider(
                  create: (context) => LoginBloc(SharedPreferences.getInstance() as SharedPreferences),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5,
                        right: 35,
                        left: 35),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) => null,
                          onChanged: (val){
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginTextChangedEvent(
                              phoneController.text,
                              passwordController.text));
                          },
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          decoration: InputDecoration(
                              fillColor: Colors.white10,
                              filled: true,
                              labelText: 'Số điện thoại',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white24)),
                              labelStyle: TextStyle(color: Colors.black)
                              ),
                        ),
                        
                        SizedBox(height: 30),
                        TextFormField(
                          validator: (val) => null,
                          onChanged: (val){
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginTextChangedEvent(
                              phoneController.text,
                              passwordController.text));
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.white10,
                              filled: true,
                              labelText: 'Mật khẩu',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white24)),
                              labelStyle: TextStyle(color: Colors.black)
                              ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<LoginBloc,LoginState>(
                              builder: (context,state) {
                                return CupertinoButton(
                                  onPressed: () {
                                    handleLogin();
                                  },
                                  color: (state is LoginInvalidState) ? Colors.black
                                  : Colors.grey,
                                  child: Text('Đăng nhập',
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                );
                              }
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
                        ),
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
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
