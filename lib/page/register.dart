import 'package:camera_app/service/apiAuth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeRegisterPage extends StatefulWidget {
  HomeRegisterPage({super.key});

  @override
  State<HomeRegisterPage> createState() => _HomeRegisterPageState();
}

class _HomeRegisterPageState extends State<HomeRegisterPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypepasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final api = ApiAuth();

  void handleRegister() async {
    String address = addressController.text;
    String fullname = fullNameController.text;
    String password = passwordController.text;
    String retypepassword = retypepasswordController.text;
    String phone = phoneController.text;
    if (address.isEmpty ||
        fullname.isEmpty ||
        password.isEmpty ||
        retypepassword.isEmpty ||
        phone.isEmpty) {
      Fluttertoast.showToast(
          msg:
              'Vùi lòng nhập lại Địa chỉ, Họ và Tên, Mật khẩu hoặc Số Điện Thoại không để trống',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Fluttertoast.showToast(
            msg: 'Đăng ký thành công', gravity: ToastGravity.CENTER);
        Navigator.pushNamed(context, '/');
      });
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
            Colors.white54,
            Colors.lightBlue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 120),
              child: Text(
                'Tạo tài khoản \n📷',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                          fillColor: Colors.white10,
                          filled: true,
                          labelText: 'Địa chỉ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.black)
                          ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: fullNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.white10,
                          filled: true,
                          labelText: 'Họ và Tên',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.black)
                          ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: Colors.white10,
                          filled: true,
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.black)
                              ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
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
                              color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.black)
                          ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: retypepasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white10,
                          filled: true,
                          labelText: 'Nhập lại Mật khẩu',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white24)),
                          labelStyle: TextStyle(color: Colors.black)
                          ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              icon: Icon(Icons.arrow_back)),
                        ),
                        TextButton(
                          onPressed: () {
                            handleRegister();
                          },
                          child: Text('Đăng Ký',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
