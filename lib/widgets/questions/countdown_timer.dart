import 'package:flutter/material.dart';

import 'package:learning_app/configs/colors.dart';

class CountDownTimer extends StatelessWidget {
  final String time;
  final Color? color;
  const CountDownTimer({required this.time, this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.timer_sharp,
          color: primaryColorY,
          size: 17,
        ),
        const SizedBox(width: 3),
        Text(time,
            style: TextStyle(
                fontSize: 16, color: color, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
