import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  const ContentArea({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: const BoxDecoration(
            color:
                // Colors.red
                Color.fromARGB(255, 246, 244, 244)),
        child: child,
        // padding: EdgeInsets.only (left: 15, right: 15),
      ),
    );
  }
}
