// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/app_icons.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/question_paper/q_paper_controller.dart';
import 'package:learning_app/screens/home/menu_screen.dart';
import 'package:learning_app/screens/home/q_card.dart';
import 'package:learning_app/widgets/app_circle_button.dart';
import 'package:learning_app/widgets/content_area.dart';

import '../../controllers/zoom_drawer_controller.dart';

class HomeScreen extends GetView<ZoomDController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routName = "/home_screen";
  @override
  Widget build(BuildContext context) {
    QPaperController _qPaperController = Get.find();
    ImageProvider bgMain = const AssetImage("assets/images/bg_canva.png");

    return Scaffold(body: GetBuilder<ZoomDController>(
      builder: (_) {
        return ZoomDrawer(
            borderRadius: 50.0,
            angle: 0.0,
            menuScreenOverlayColor: Colors.white,
            menuScreenWidth: double.maxFinite,
            // clipMainScreen: true,
            showShadow: true,
            drawerShadowsBackgroundColor:
                const Color.fromARGB(255, 183, 179, 179),
            style: DrawerStyle.defaultStyle,
            controller: _.zoomDrawerController,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
            menuScreen:
                // SafeArea(child:
                const MyMenuScreen(),
            mainScreen: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: bgMain, fit: BoxFit.fill)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 3),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppCircleButton(
                                    onTap: controller.toggleDrawer,
                                    shadow: false,
                                    align: Alignment.topCenter,
                                    child: const Icon(
                                      AppIcons.menuLeft,
                                      color: primaryColorY,
                                    ),
                                  ),
                                  AppCircleButton(
                                    width: Get.width * 0.18,
                                    height: Get.width * 0.18,
                                    onTap: () {},
                                    shadow: false,
                                    child: Image.asset(
                                      "assets/images/own_logo.png",
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    AppIcons.victorySign,
                                    color: primaryColorY,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Obx(() => Text(
                                        controller.user.value == null
                                            ? "Hello friend"
                                            : "Hello ${controller.user.value!.displayName}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: textColorHeading,
                                            letterSpacing: 2.5),
                                      ))
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Learn today with Qlearn",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21,
                                      color: primaryColorY,
                                      letterSpacing: 2.5),
                                ),
                              ),
                            ]),
                      ),

                      Expanded(
                        child:
                            //    Padding(
                            // padding: const EdgeInsets.symmetric(horizontal: 15),
                            // child:
                            ContentArea(
                          child: Obx(() => ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                padding: const EdgeInsets.all(25.0),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return QCard(
                                      model:
                                          _qPaperController.allImages[index]);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: _qPaperController.allImages.length,
                              )),
                        ),
                        // )
                      ),
                      // ),
                    ],
                  ),
                ),
              ),
            ));
      },
    ));
  }
}
