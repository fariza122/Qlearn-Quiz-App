import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/widgets/questions/ans_card.dart';

class QNumCard extends StatelessWidget {
  final AnsStatus? status;
  final VoidCallback onTap;
  final int index;
  const QNumCard(
      {required this.index,
      required this.status,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _bgColor;
    //  = primaryColorY.withOpacity(0.9);
    switch (status) {
      case AnsStatus.answered:
        _bgColor = primaryColorY.withOpacity(0.9);
        break;

      case AnsStatus.unanswered:
        _bgColor = Colors.blueGrey.withOpacity(0.24);
        break;
      case AnsStatus.correct:
        _bgColor = const Color.fromARGB(255, 0, 255, 132);
        break;
      case AnsStatus.wrong:
        _bgColor = const Color.fromARGB(255, 255, 90, 78);
        break;

      default:
        _bgColor = Colors.blueGrey.withOpacity(0.24);
    }
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        width: Get.width * 0.15,
        height: Get.width * 0.15,
        // padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: _bgColor, borderRadius: BorderRadius.circular(50)),
        // status == AnsStatus.answered
        //     ? primaryColorY.withOpacity(0.9)
        //     : Colors.white.withOpacity(0.24),

        child: Center(
          child: Text('$index',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
