import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    ImageProvider bg = AssetImage("assets/images/bg_canva.png");
    ImageProvider man = AssetImage("assets/images/manpo.png");
    ImageProvider manPointUp = AssetImage("assets/images/manPointUp.png");
    ImageProvider womanPointUp = AssetImage("assets/images/womenPointing.png");
    ImageProvider women = AssetImage("assets/images/women.png");
    ImageProvider stationary = AssetImage("assets/images/stationary_bg.png");
    ImageProvider stationary_Bg = AssetImage("assets/images/statio_bg.png");

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bg,
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: stationary_Bg,
              colorFilter: const ColorFilter.srgbToLinearGamma(),
              opacity: 0.5,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: Get.width,
                  height: Get.width * 0.48,
                  decoration: const BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("assets/images/own_logo.png"),
                          fit: BoxFit.contain))),

              Container(
                width: Get.width * 0.8,
                height: Get.width * 0.13,
                // top: Get.height * 0.26,
                // left: Get.width * 0.18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: GestureDetector(
                  onTap: () {
                    controller.signInWithGoogle();
                  },
                  child:
                      //  Container(
                      //   // width: 300,
                      //   // height: 60,
                      //   // decoration: BoxDecoration(
                      //   //     borderRadius: BorderRadius.circular(15),
                      //   //     color: Colors.white),
                      //   child:
                      Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/google.svg"),
                      const SizedBox(width: 9),
                      const Text(
                        "Sign in with Google",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: primaryColorY),
                      )
                    ],
                  ),
                  // )
                ),
              ),
              // ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.65,
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(image: womanPointUp, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
