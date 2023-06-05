import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/question_screen_controller.dart';
import 'package:learning_app/screens/questions/result_screen.dart';
import 'package:learning_app/widgets/content_area.dart';
import 'package:learning_app/widgets/custom_appbar.dart';
import 'package:learning_app/widgets/questions/ans_card.dart';

class CorrectAnsScreen extends GetView<QScreenController> {
  const CorrectAnsScreen({Key? key}) : super(key: key);

  static const String routeName = "/correct_ans_screen";
  @override
  Widget build(BuildContext context) {
    ImageProvider q_bg = const AssetImage("assets/images/q_bg.png");

    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: q_bg, fit: BoxFit.fill)),
            child: Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 100,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: CustomAppbar(
                            titleWidget: Obx(
                              (() => Text(
                                    "Qno: ${controller.qIndex.value + 1}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: primaryColorY,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                            showMenuIcon: true,
                            onMenuTap: () {
                              Get.toNamed(ResultScreen.routeName);
                            }),
                      ),
                      Expanded(
                        child: ContentArea(
                            child: SingleChildScrollView(
                          padding: const EdgeInsets.all(25),
                          // only(top: 45, left: 20),
                          child: Column(
                            children: [
                              Text(
                                controller.currentQuestion.value!.question,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GetBuilder<QScreenController>(
                                  id: "ans_review_list",
                                  builder: (context) {
                                    return ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final answers = controller
                                              .currentQuestion
                                              .value!
                                              .answers[index];
                                          final correctAns = controller
                                              .currentQuestion
                                              .value!
                                              .correctAnswer;
                                          final selectedAns = controller
                                              .currentQuestion
                                              .value!
                                              .selectedAnswer;
                                          final String ans =
                                              "${answers.identifier}.  ${answers.answer}";
                                          if (selectedAns == correctAns &&
                                              answers.identifier ==
                                                  selectedAns) {
                                            //correct answer
                                            return CorrectAns(answer: ans);
                                          } else if (selectedAns == null &&
                                              correctAns ==
                                                  answers.identifier) {
                                            // unaswered
                                            return Unanswered(answer: ans);
                                          } else if (selectedAns !=
                                                  correctAns &&
                                              answers.identifier ==
                                                  selectedAns) {
                                            //wrong answer
                                            return WrongAns(answer: ans);
                                          } else if (correctAns ==
                                              answers.identifier) {
                                            return CorrectAns(answer: ans);
                                          }
                                          return AnsCard(
                                              isSelected: false, answer: ans);
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const SizedBox(height: 20),
                                        itemCount: controller.currentQuestion
                                            .value!.answers.length);
                                  }),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                ))));
  }
}
