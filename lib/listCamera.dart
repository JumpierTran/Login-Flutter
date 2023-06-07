import 'package:flutter/material.dart';
import 'package:signin_signup_ui/signIn.dart';
import 'dart:core';

final findController = TextEditingController();

void main() {
  runApp(const ListCamera());
}

class ListCamera extends StatelessWidget {
  const ListCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form List Camera',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FormListCamera(),
    );
  }
}

class FormListCamera extends StatefulWidget {
  const FormListCamera({super.key});

  @override
  State<FormListCamera> createState() => _FormListCameraState();
}

class _FormListCameraState extends State<FormListCamera> {
  late String valueChoose;
  List listItem = ["Thêm camera", "Chính sách sử dụng", "Đăng xuất"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          centerTitle: true,
          title: const Text(
            'Danh sách Camera',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 241, 255, 180),
            ),
          ),
          actions: <Widget>[
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.greenAccent),
              child: PopupMenuButton<int>(
                icon: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.black38,
                ),
                color: Colors.grey[300],
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      listItem[0],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      listItem[1],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text(
                      listItem[2],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                onSelected: (item) => SelectedItem(context, item),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: findController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Tìm camera',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    gapPadding: 1,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SelectedItem(BuildContext context, int item) {
    print("${listItem[item]} Click");
  }
}
