import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/question_screen_controller.dart';
import 'package:learning_app/widgets/content_area.dart';
import 'package:learning_app/widgets/custom_appbar.dart';
import 'package:learning_app/widgets/main_button.dart';
import 'package:learning_app/widgets/questions/ans_card.dart';
import 'package:learning_app/widgets/questions/countdown_timer.dart';
import 'package:learning_app/widgets/questions/ques_number_card.dart';

class QuizOverviewScreen extends GetView<QScreenController> {
  const QuizOverviewScreen({Key? key}) : super(key: key);

  static const String routeName = "/quiz_overvew";

  @override
  Widget build(BuildContext context) {
    ImageProvider q_bg = const AssetImage("assets/images/q_bg.png");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(),
      //     AppBar(
      //   backgroundColor: Colors.transparent,
      //   iconTheme: IconThemeData(color: primaryColorY),
      // ),
      body:
          //  Stack(
          //   children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: q_bg, fit: BoxFit.fill)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 14,
                    right: 14,
                  ),
                  child: ContentArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(children: [
                        Positioned(
                          top: Get.height * 0.2,
                          // left: Get.width * 0.08,
                          child: Obx(
                            () => CountDownTimer(
                              time: '${controller.time} Remaining',
                              color: primaryColorY,
                            ),
                          ),
                        ),

                        // const SizedBox(
                        //   height: 19,
                        // ),
                        Positioned(
                          top: Get.height * 0.27,
                          // left: Get.width * 0.07,
                          child: Container(
                            width: Get.width,
                            height: Get.width * 0.15,
                            // color: Colors.red,
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  AnsStatus? _answerStatus = controller
                                              .allQuesAndAns[index]
                                              .selectedAnswer !=
                                          null
                                      ? AnsStatus.answered
                                      : AnsStatus.unanswered;
                                  return QNumCard(
                                      index: index + 1,
                                      status: _answerStatus,
                                      onTap: () {
                                        controller.jumpToQuestion(index);
                                      });
                                  // InkWell(
                                  //   onTap: (){

                                  //   },
                                  //   child: Container(
                                  //     width: Get.width * 0.15,
                                  //     height: Get.width * 0.15,
                                  //     decoration: BoxDecoration(
                                  //         color: controller.allQuesAndAns[index]
                                  //                     .selectedAnswer !=
                                  //                 null
                                  //             ? primaryColorY.withOpacity(0.9)
                                  //             : Colors.white.withOpacity(0.24),
                                  //         borderRadius: BorderRadius.circular(50)),
                                  //     child: Center(child: Text("${index + 1}")),
                                  //   ),
                                  // );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                          width: 12,
                                        ),
                                itemCount: controller.allQuesAndAns.length),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 120,
                        // ),

                        Center(
                          child: Text(
                            controller.completedQuiz,
                            style: const TextStyle(
                              color: primaryColorY,
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: MainButton(
                                onTap: () {
                                  controller.onCompletingQuiz();
                                  // Get.offAndToNamed(ResultScreen.routeName);
                                },
                                title: "Complete",
                              ),
                            ))
                        //   ],
                        // )
                      ]),
                    ),
                  ),
                ),
              )),

      // ],
      // )
    );
  }
}
