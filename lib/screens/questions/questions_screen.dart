import 'package:flutter/material.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/question_screen_controller.dart';
import 'package:get/get.dart';
import 'package:learning_app/firebase_refrences/loading_status.dart';
import 'package:learning_app/screens/questions/quiz_overview_screen.dart';
import 'package:learning_app/widgets/common/question_placeholder.dart';
import 'package:learning_app/widgets/content_area.dart';
import 'package:learning_app/widgets/custom_appbar.dart';
import 'package:learning_app/widgets/main_button.dart';
import 'package:learning_app/widgets/questions/ans_card.dart';
import 'package:learning_app/widgets/questions/countdown_timer.dart';

class QuestionsScreen extends GetView<QScreenController> {
  const QuestionsScreen({Key? key}) : super(key: key);

  static const String routeName = "/question_screen";

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
                          leading: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 4),
                            decoration: const ShapeDecoration(
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: primaryColorY, width: 2))),
                            child: Obx(() => CountDownTimer(
                                  time: controller.time.value,
                                  color: primaryColorY,
                                )),
                          ),
                          showMenuIcon: true,
                          // onMenuTap: controller.goToQuizOverviewScreen(),
                        ),
                      ),
                      Expanded(
                        child: ContentArea(
                            child: controller.loadingStatus.value ==
                                    LoadingStatus.completed
                                ? SingleChildScrollView(
                                    padding: const EdgeInsets.all(25),
                                    // only(top: 45, left: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          controller
                                              .currentQuestion.value!.question,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        GetBuilder<QScreenController>(
                                            id: "ans_list",
                                            builder: (context) {
                                              return ListView.separated(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    final answers = controller
                                                        .currentQuestion
                                                        .value!
                                                        .answers[index];
                                                    return AnsCard(
                                                        onPressed: () {
                                                          controller
                                                              .selectedAnswer(
                                                                  answers
                                                                      .identifier);
                                                        },
                                                        isSelected: answers
                                                                .identifier ==
                                                            controller
                                                                .currentQuestion
                                                                .value!
                                                                .selectedAnswer,
                                                        answer:
                                                            "${answers.identifier}.  ${answers.answer}");
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          const SizedBox(
                                                              height: 20),
                                                  itemCount: controller
                                                      .currentQuestion
                                                      .value!
                                                      .answers
                                                      .length);
                                            }),
                                      ],
                                    ),
                                  )
                                :
                                //  controller.loadingStatus.value == LoadingStatus.loading
                                //     ?
                                const QPlaceHolder()),
                      ),
                      ColoredBox(
                        color: Colors.white,
                        //  const Color.fromARGB(255, 246, 244, 244),
                        // height: Get.height * 0.08,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(children: [
                            Visibility(
                                // visible: true,
                                visible: controller.isFirstQ,
                                child: SizedBox(
                                  width: Get.width * 0.13,
                                  height: Get.height * 0.065,
                                  child: MainButton(
                                    onTap: () {
                                      controller.prevQuestion();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryColorG,
                                      size: 24,
                                    ),
                                  ),
                                )),
                            controller.isFirstQ
                                ? const SizedBox(
                                    width: 6,
                                  )
                                : const SizedBox(),
                            Expanded(
                              child: Visibility(
                                  visible: true,
                                  // controller.isLastQ,
                                  child: MainButton(
                                      onTap: () {
                                        controller.isLastQ
                                            ? Get.toNamed(
                                                QuizOverviewScreen.routeName)
                                            : controller.nextQuestion();
                                      },
                                      title: controller.isLastQ == false
                                          ? "Next Question"
                                          : controller.loadingStatus.value ==
                                                  LoadingStatus.loading
                                              ? " "
                                              : "Completed")),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
