import 'package:camera_app/service/apiAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ApiAuth().logoutUser();
              },
              icon: Icon(Icons.logout))
        ],
        title: Text(
          'My Camera',
          style: TextStyle(fontSize: 23),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome App Camera',
              style: TextStyle(color: const Color.fromARGB(1, 45, 54, 23)),
            ),
            Icon(Icons.camera_alt),
            Expanded(
                child: Text(
              'Camera Red',
              style: TextStyle(backgroundColor: Colors.red),
            )),
            Icon(Icons.camera_alt),
            Expanded(
                child: Text(
              'Camera Yellow',
              style: TextStyle(backgroundColor: Colors.yellowAccent),
            )),
            Icon(Icons.camera_alt),
            Expanded(
                child: Text(
              'Camera Green',
              style: TextStyle(backgroundColor: Colors.greenAccent),
            )),
          ],
        ),
      ),
    );
  }
}
