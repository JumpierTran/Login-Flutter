import 'package:flutter/material.dart';

class DetailMyCamera extends StatefulWidget {
  const DetailMyCamera({super.key});

  @override
  State<DetailMyCamera> createState() => _DetailMyCameraState();
}

class _DetailMyCameraState extends State<DetailMyCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 10,top: 40,left: 10),
        child: Stack(
          children: [
            CircleAvatar(
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/dashboard");
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 45, top: 150),
              child: Text(
                'Chi tiết Video',
                style: TextStyle(fontSize: 23, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
