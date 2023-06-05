import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/qscreen_controller_extension.dart';
import 'package:learning_app/controllers/question_screen_controller.dart';
import 'package:learning_app/screens/questions/correct_ans_screen.dart';
import 'package:learning_app/widgets/content_area.dart';
import 'package:learning_app/widgets/custom_appbar.dart';
import 'package:learning_app/widgets/questions/ans_card.dart';
import 'package:learning_app/widgets/questions/ques_number_card.dart';

class ResultScreen extends GetView<QScreenController> {
  const ResultScreen({Key? key}) : super(key: key);

  static const String routeName = "/result_screen";

  @override
  Widget build(BuildContext context) {
    ImageProvider q_bg = const AssetImage("assets/images/q_bg.png");

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:
          BoxDecoration(image: DecorationImage(image: q_bg, fit: BoxFit.fill)),
      child: Column(
        children: [
          const CustomAppbar(
            titleWidget: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "You Did It!!",
                style: TextStyle(
                  letterSpacing: 4,
                  fontSize: 18,
                  color: primaryColorY,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            leading: SizedBox(
              width: 20,
              height: 70,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(top: Get.height * 0.03, left: 15, right: 15),
              child: ContentArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: Get.height * 0.1),
                child: Column(
                  children: [
                    Center(
                        child: SvgPicture.asset(
                      "assets/images/bulb.svg",
                      color: const Color.fromARGB(255, 128, 24, 24),
                    )),
                    const Text(
                      "Congratulations",
                      style: TextStyle(
                        fontSize: 23,
                        color: primaryColorY,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    // const SizedBox(
                    //   height: ,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "${controller.correctQCount} out of ${controller.allQuesAndAns.length} correct",
                            style: const TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                color: primaryColorY),
                          ),
                          Text(
                            "${controller.uncompletedQuiz} unanswered",
                            style: const TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                color: primaryColorY),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Tap on the any circle to see the correct answer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColorG,
                        // fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      height: Get.width * 0.15,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            AnsStatus? _answerStatus = AnsStatus.unanswered;

                            if (controller
                                    .allQuesAndAns[index].selectedAnswer ==
                                controller.allQuesAndAns[index].correctAnswer) {
                              _answerStatus = AnsStatus.correct;
                            } else if (controller
                                    .allQuesAndAns[index].selectedAnswer ==
                                null) {
                              _answerStatus = AnsStatus.unanswered;
                            } else {
                              _answerStatus = AnsStatus.wrong;
                            }

                            return QNumCard(
                                index: index + 1,
                                status: _answerStatus,
                                onTap: () {
                                  controller.jumpToQuestion(index,
                                      goToQ: false);
                                  Get.toNamed(CorrectAnsScreen.routeName);
                                });
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                                width: 12,
                              ),
                          itemCount: controller.allQuesAndAns.length),
                    ),
                  ],
                ),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.5,
              right: 16,
            ),
            child: Container(
              width: Get.width,
              height: Get.width * 0.2,
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.srcATop,
                border: Border.all(
                    color: const Color.fromARGB(255, 246, 244, 244),
                    width: 0,
                    style: BorderStyle.solid),
                color: const Color.fromARGB(255, 246, 244, 244),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      controller.tryAgain();
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.078,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 128, 24, 24),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                          child: Text(
                        "Try again",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.saveUserTestHistory();
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.078,
                      decoration: BoxDecoration(
                        color: primaryColorY,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                          child: Text(
                        "Go Home",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: primaryColorG),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
