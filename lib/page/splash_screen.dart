import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({super.key});

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  Scaffold onLoading() {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText('Chào mừng đến với',speed: Duration(microseconds: 1000)),
                  TypewriterAnimatedText('VSHome'),
                ],
                // onFinished: () => onLoading(),
                ),
                
              )),
        ),
      ),
    );
  }
}
