import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/colors.dart';
import '../../widgets/app_circle_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider man = const AssetImage("assets/images/introBg.png");
    ImageProvider bgintro = const AssetImage("assets/images/bg_canva.png");
    const String routeName = '/intro_Screen';
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: bgintro,
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          // Align(
          //   alignment: Alignment.topCenter,
          // child:
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   child:
          Container(
            width: Get.width,
            height: Get.height * 0.64,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.red),
              image: DecorationImage(
                  image: man,
                  fit: BoxFit.fill,
                  // filterQuality: FilterQuality.low,
                  alignment: Alignment.topCenter),
            ),
          ),
          // ),
          // ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: Get.height * 0.4,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(100.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Get.width * 0.8,
                    child: const Text(
                      "Boost Your Knowledge With Our Quiz App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColorHeading,
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //  const SizedBox(
                  //     height: 25,
                  //   ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: Get.width * 0.95,
                    child: const Text(
                      "A study app that will boost your knowledge developed by Fariza Siddiqui",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColorSubHeading,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  AppCircleButton(
                    color: primaryColorY,
                    width: 60,
                    height: 60,
                    shadow: true,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: Get.width * 0.07,
                    ),
                    onTap: () => Get.offAndToNamed("/home_screen"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
