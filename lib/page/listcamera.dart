import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                    tooltip: "Xem thông tin",
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  SizedBox(width: 25),
                  IconButton(
                    icon: Icon(IconlyLight.logout),
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phổ biến',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                    Text('Xem tất cả',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
                  ],
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        childAspectRatio: 0.79),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(30)),
                              width: 180,
                              child: Image.asset("assets/image/air-conditioner.png",height: 50,width: 50,),
                            ),
                          ),
                          Text('Camera',style: TextStyle(fontSize: 18),),
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
