import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  void showCamera() {}

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
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomAppBarItem(context,
                      icon: IconlyLight.home, label: 'Home'),
                  _bottomAppBarItem(context,
                      icon: IconlyLight.camera, label: 'Camera'),
                  _bottomAppBarItem(context,
                      icon: IconlyLight.profile, label: 'Profile'),
                ]),
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 45, top: 135),
              child: Text(
                'Danh sách camera \n của bạn 📸',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    child: Image.asset(
                      'assets/image/camera1.png',
                      scale: 10,
                    ),
                  ),
                  SizedBox(height: 30),
                  CircleAvatar(
                    child: Image.asset(
                      'assets/image/camera2.png',
                      scale: 8,
                    ),
                  ),
                  SizedBox(height: 30),
                  CircleAvatar(
                    child: Image.asset('assets/image/camera3.png'),
                  ),
                ],
              ),
            ),
            Container(
              color: CupertinoColors.lightBackgroundGray,
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 22),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(IconlyLight.logout),color: Colors.blueAccent,iconSize: 30),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required label}) {
    return GestureDetector(
      onTap: () {
        if (icon == IconlyLight.home) {
          Navigator.pushNamed(context, '/');
        } else if (icon == IconlyLight.camera) {
          Navigator.pushNamed(context, '/devices');
        } else if (icon == IconlyLight.profile) {
          Navigator.pushNamed(context, '/profile');
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon), Text(label)],
      ),
    );
  }
}
