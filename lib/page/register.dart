import 'package:camera_app/core/constpublic.dart';
import 'package:flutter/material.dart';

class HomeRegisterPage extends StatefulWidget {
  HomeRegisterPage({super.key});

  @override
  State<HomeRegisterPage> createState() => _HomeRegisterPageState();
}

class _HomeRegisterPageState extends State<HomeRegisterPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypepasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.cyan,
            Colors.greenAccent,
          ],
        ),
      ),
      // color: Colors.white,
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
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
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
                      buttonRegister(),
                      SizedBox(height: 10),
                      backbuttonlogin(),  
                    ],
                  ),
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Vui lòng nhập địa chỉ";
        }
        return null;
      },
      decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          labelText: 'Địa chỉ',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelStyle: ConstPublic.inputTextFormField
      ),
    );
  }

  Widget fullnameTextField() {
    return TextFormField(
      controller: fullNameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Vui lòng nhập họ và tên";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white10,
        filled: true,
        labelText: 'Họ và Tên',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        labelStyle: ConstPublic.inputTextFormField,
      ),
    );
  }

  Widget phoneTextField() {
    return TextFormField(
      controller: phoneController,
      validator: (value) {
        if (value == null || value.isEmpty || value.length == 10) {
          return "Vui lòng nhập số điện thoại";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: Colors.white10,
        filled: true,
        labelText: 'Phone',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        labelStyle: ConstPublic.inputTextFormField,
      ),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty || value.length >= 8) {
          return "Vui lòng nhập mật khẩu";
        }
        return null;
      },
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
  }

  Widget retypepasswordTextField() {
    return TextFormField(
      controller: retypepasswordController,
      validator: (value) {
        if (value == null || value.isEmpty || value.length >= 8) {
          return "Vui lòng nhập lại mật khẩu";
        }
        return null;
      },
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
        fillColor: Colors.white10,
        filled: true,
        labelText: 'Nhập lại Mật khẩu',
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
  }

  Widget backbuttonlogin() {
    return TextButton(
      onPressed: () {
        Navigator.pop(context, "/login");
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      child: Text('Trở về đăng nhập',style: ConstPublic.buttonOtherStyle
      )
    );
  }

  Widget buttonRegister() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: Text('ĐĂNG KÝ', style: ConstPublic.buttonFontStyle),
    );
  }
}
