import 'package:camera_app/core/constpublic.dart';
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

  bool isPasswordVisible = true;

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
            Colors.white,
            Colors.lightBlue,
            Colors.cyanAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 90),
              child: Text('Tạo tài khoản tại đây📷',
                  style: ConstPublic.titleFontStyle),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    addressTextField(),
                    SizedBox(height: 20),
                    fullnameTextField(),
                    SizedBox(height: 20),
                    phoneTextField(),
                    SizedBox(height: 20),
                    passwordTextField(),
                    SizedBox(height: 20),
                    retypepasswordTextField(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        circleAvatarButton(),
                        ButtonRegister(),
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

  Widget addressTextField() {
    return TextFormField(
      controller: addressController,
      decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          labelText: 'Địa chỉ',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelStyle: ConstPublic.inputTextFormField),
    );
  }

  Widget fullnameTextField() {
    return TextFormField(
      controller: fullNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          labelText: 'Họ và Tên',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelStyle: ConstPublic.inputTextFormField),
    );
  }

  Widget phoneTextField() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          labelText: 'Phone',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelStyle: ConstPublic.inputTextFormField),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      controller: passwordController,
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
        fillColor: Colors.white10,
        filled: true,
        labelText: 'Mật khẩu',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
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
  }

  Widget retypepasswordTextField() {
    return TextFormField(
      controller: retypepasswordController,
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
        fillColor: Colors.white10,
        filled: true,
        labelText: 'Nhập lại Mật khẩu',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
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
  }

  Widget circleAvatarButton() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.black,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)),
    );
  }

  Widget ButtonRegister() {
    return TextButton(
      onPressed: () {
        handleRegister();
      },
      child: Text('ĐĂNG KÝ', style: ConstPublic.buttonFontStyle),
    );
  }
}
