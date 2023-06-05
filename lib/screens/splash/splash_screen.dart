import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider bgSplash = const AssetImage("assets/images/splash_bg3.jpg");
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: bgSplash,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 60, vertical: 200),
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              // margin: EdgeInsets.symmetric(horizontal: 60, vertical: 200),
              child: Image.asset("assets/images/own_logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
