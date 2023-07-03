import 'package:camera_app/bloc/listcamera/listcamera_bloc.dart';
import 'package:camera_app/bloc/listcamera/listcamera_state.dart';
import 'package:camera_app/model/model_camera.dart';
import 'package:camera_app/service/sessionmanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isPressed = false;

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
                    color: isPressed ? Colors.lightBlue : null,
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });

                      Navigator.pushNamed(context, '/images');
                    },
                    tooltip: "Xem thông tin",
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Xử lý khi nhấp vào ô tìm kiếm
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.lightBlue.withOpacity(0.8),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                    hintText: "Tìm kiếm Camera",
                                    hintStyle: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            Colors.lightBlue.withOpacity(0.8))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 25),
                  IconButton(
                    icon: Icon(IconlyLight.logout),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/login", (route) => false);
                      SessionManager.clearSession();
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    Text('Xem tất cả',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16))
                  ],
                ),
              ),
            ),
            Expanded(
                child: BlocConsumer<ListCameraBloc, ListCameraState>(
                    listener: (context, state) {
              if (state is ListCameraFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            }, builder: (context, state) {
              if (state is ListCameraLoading) {
                return _buildLoading();
              } else if (state is ListCameraLoaded) {
                return _buildListCamera(
                    context, state.cameraList as CameraModel);
              } else if (state is ListCameraFailure) {
                return Center(
                  child: Text(
                      'Lỗi không lấy được danh sách camera${state.errorMessage}'),
                );
              } else {
                return Text(
                  "Default UI",
                  style: TextStyle(color: Colors.lightBlue.withOpacity(0.8)),
                );
              }
            }))
          ],
        ),
      ),
    );
  }

  Widget _buildListCamera(BuildContext context, CameraModel modelAttribute) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, childAspectRatio: 0.79),
        itemCount: modelAttribute.data!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/images");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        "Devices_id: ${modelAttribute.data![index].attributes!.deviceId}",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Text(
                        "User_id ${modelAttribute.data![index].attributes!.userId}",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    width: 180,
                    height: 10,
                    child: Image.asset(
                      "assets/image/camera_visitor.png",
                      height: 50,
                      width: 50,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
