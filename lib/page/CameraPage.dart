import 'package:flutter/material.dart';

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
        leading: Icon(
          Icons.camera,
          color: Colors.blueAccent,
        ),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_indoor_rounded),
            Expanded(child: Text('Camera Red')),
            Icon(Icons.camera_indoor_rounded),
            Expanded(child: Text('Camera Yellow')),
            Icon(Icons.camera_indoor_rounded),
            Expanded(child: Text('Camera Green')),
          ],
        ),
      ),
    );
  }
}
