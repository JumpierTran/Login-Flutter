import 'package:flutter/material.dart';

class DetailMyCamera extends StatefulWidget {
  const DetailMyCamera({super.key});

  @override
  State<DetailMyCamera> createState() => _DetailMyCameraState();
}

class _DetailMyCameraState extends State<DetailMyCamera> {
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
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // bottomNavigationBar: BottomAppBar(
        //   child: Container(
        //     padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         _bottomAppBarItem(context,icon: IconlyLight.image,label: 'Image'),
        //         _bottomAppBarItem(context,icon: IconlyLight.camera,label: 'Camera'),
        //         _bottomAppBarItem(context,icon: IconlyLight.profile,label: 'Profile'),
        //       ],
        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 45,top: 150),
              child: Text('Chi tiết Video',style: 
              TextStyle(
                fontSize: 23,
                color: Colors.black),),
            )
          ],
        ),
      ),
    );
  }

  // Widget _bottomAppBarItem(BuildContext context,
  //     {required icon, required label}) {
  //   return GestureDetector(
  //     onTap: () {
  //       if (icon == IconlyLight.image) {
  //         Navigator.pushNamed(context, '/dashboard');
  //       } else if (icon == IconlyLight.camera) {
  //         Navigator.pushNamed(context, '/devices');
  //       } else if (icon == IconlyLight.profile) {
  //         Navigator.pushNamed(context, '/profile');
  //       }
  //     },
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [Icon(icon), Text(label)],
  //     ),
  //   );
  // }
  
}
