import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/configs/app_icons.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/question_paper/q_paper_controller.dart';
import 'package:learning_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:learning_app/widgets/app_icon_text.dart';

class QCard extends GetView<QPaperController> {
  const QCard({Key? key, required this.model}) : super(key: key);
  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    ImageProvider bgQCard =
        const AssetImage("assets/images/bg_canva_yellow.png");
    const padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: bgQCard, fit: BoxFit.cover, opacity: 0.9)),
      child: InkWell(
        onTap: () {
          controller.checkingIfUserLoggedIn(paper: model, tryAgain: false);
        },
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ColoredBox(
                      color: Colors.transparent,
                      // primaryColorY.withOpacity(0.8),
                      child: SizedBox(
                          height: Get.width * 0.15,
                          width: Get.width * 0.15,
                          child: model.imageUrl!.isEmpty
                              ? Container(
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                      color: primaryColorG),
                                )
                              : CachedNetworkImage(
                                  imageUrl: model.imageUrl!,
                                  placeholder: (context, url) => Container(
                                    alignment: Alignment.center,
                                    child: const CircularProgressIndicator(
                                        color: primaryColorG),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset("assets/images/own_logo.png"),
                                )
                          //  _qPaperController.allImagePath.isEmpty
                          //     ? const CircularProgressIndicator(color: primaryColorY)
                          //     : Image.network(_qPaperController.allImagePath[index]),

                          ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: const TextStyle(
                              color: primaryColorG,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                            model.description,
                            style: const TextStyle(
                              color: textColorHeading,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            AppIconText(
                                icon: Icon(
                                  Icons.help_outline_outlined,
                                  color: primaryColorG,
                                  size: Get.width * 0.04,
                                ),
                                text: Text(
                                  "${model.questionCount} quizzes",
                                  style: TextStyle(
                                    fontSize: Get.width * 0.03,
                                    color: primaryColorG,
                                  ),
                                )),
                            const SizedBox(
                              width: 12,
                            ),
                            AppIconText(
                                icon: Icon(
                                  Icons.timer,
                                  color: primaryColorG,
                                  size: Get.width * 0.04,
                                ),
                                text: Text(
                                  model.qTimeInMins(),
                                  style: TextStyle(
                                    fontSize: Get.width * 0.03,
                                    color: primaryColorG,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  width: 50,
                  height: 37,
                  bottom: -10,
                  right: -10,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                          color: primaryColorG,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )),
                      child: const Icon(
                        AppIcons.trophy_Outlined,
                        size: 20,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
