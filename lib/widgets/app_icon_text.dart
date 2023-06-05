import 'package:flutter/material.dart';

class AppIconText extends StatelessWidget {
  Icon icon;
  Widget text;
  AppIconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 6,
        ),
        text
      ],
    );
  }
}
