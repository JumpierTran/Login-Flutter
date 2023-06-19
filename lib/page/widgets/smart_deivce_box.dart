import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  const SmartDeviceBox({super.key,
  required this.smartDeviceName,
  required this.iconPath,
  required this.powerOn});


  final String smartDeviceName;
  final String iconPath;
  final String powerOn;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[400]),
        child: Column(
          children: [
            Image.asset(iconPath,height: 65,)
          ]),
      ),
    );
  }
}
