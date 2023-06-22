import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // final baseService = BaseService();
  @override
  void initState() {
    super.initState();
    // getData();
  }

  final dio = Dio();

  // void getData() async {
  //   try {
  //     var response = await dio.get(
  //         'https://app.mekongsmartcam.vn/edge/vshome/api/vshome/device_users');
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  List<Thumbnail> thumbnailList = [
    Thumbnail(
      imagePath: 'assets/image/smart-tv.png',
      title: 'Thumbnail 1',
    ),
    Thumbnail(
      imagePath: 'assets/image/fan.png',
      title: 'Thumbnail 2',
    ),
    Thumbnail(
      imagePath: 'assets/image/light-bulb.png',
      title: 'Thumbnail 3',
    ),
    Thumbnail(
      imagePath: 'assets/image/air-conditioner.png',
      title: 'Thumbnail 4',
    ),
    // Thêm các thumbnail khác vào đây
  ];

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
            Colors.green,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          print('Search detail camera');
                        },
                        icon: Icon(IconlyLight.search, color: Colors.black),
                        label: Text(
                          'Search',
                          style: TextStyle(fontSize: 23, color: Colors.black),
                        )),
                    Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
              ),
              SizedBox(),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(thumbnailList[index].imagePath),
                                fit: BoxFit.cover),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          print('add');
                                        },
                                        icon: Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {
                                          print('edit');
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          print('delete');
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required label}) {
    return GestureDetector(
      onTap: () {
        if (icon == IconlyLight.home) {
          Navigator.pushNamed(context, '/login');
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

class Thumbnail {
  String imagePath;
  String title;
  Thumbnail({
    required this.imagePath,
    required this.title,
  });
}
