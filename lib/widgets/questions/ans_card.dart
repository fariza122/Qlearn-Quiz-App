import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';

enum AnsStatus { correct, wrong, answered, unanswered }

class AnsCard extends StatelessWidget {
  final String answer;
  final VoidCallback? onPressed;
  final bool isSelected;

  const AnsCard(
      {Key? key, this.onPressed, required this.answer, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider bgCardY =
        const AssetImage("assets/images/bg_canva_yellow.png");
    ImageProvider bgCardG = const AssetImage("assets/images/bg_canva.png");

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Ink(
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: Get.width * 0.04),
        height: Get.width * 0.13,
        // width: Get.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: isSelected ? primaryColorG.withOpacity(0.7) : Colors.white,
            image: DecorationImage(
                image: isSelected ? bgCardY : bgCardG,
                fit: BoxFit.cover,
                opacity: 0.8)),
        child: Text(
          answer,
          style: TextStyle(
              color: isSelected ? primaryColorG : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class CorrectAns extends StatelessWidget {
  final String answer;
  const CorrectAns({required this.answer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: Get.width * 0.04),
      height: Get.width * 0.13,
      // width: Get.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 0, 255, 132),
      ),
      child: Text(
        answer,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class WrongAns extends StatelessWidget {
  final String answer;
  const WrongAns({required this.answer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: Get.width * 0.04),
      height: Get.width * 0.13,
      // width: Get.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 90, 78),
      ),

      child: Text(
        answer,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class Unanswered extends StatelessWidget {
  final String answer;
  const Unanswered({required this.answer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: Get.width * 0.04),
      height: Get.width * 0.13,
      // width: Get.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(0.24),
      ),

      child: Text(
        answer,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
