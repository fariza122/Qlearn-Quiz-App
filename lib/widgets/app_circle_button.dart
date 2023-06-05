// import 'dart:ffi';

import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({
    Key? key,
    required this.child,
    this.color,
    this.height = 38,
    this.width = 38,
    required this.onTap,
    this.align = Alignment.center,
    required this.shadow,
  }) : super(key: key);
  final Color? color;
  final double width;
  final double height;
  final Widget child;
  final VoidCallback onTap;
  final bool shadow;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      alignment: align, // elevation: ,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  )
                ]
              : null),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
