import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';

class Dialogs {
  //private constructor
  static final Dialogs _priConstructor = Dialogs._internal();
  //singleton class
  Dialogs._internal();

//factory constructor
  factory Dialogs() {
    return _priConstructor;
  }

  static Widget alertDialogForlogin({required VoidCallback onTap}) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      // alignment: Alignment.center,
      title: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.warning_amber_rounded,
              color: primaryColorY,
              size: 26,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                "Please Login First",
                style: TextStyle(color: textColorHeading, fontSize: 19),
              ),
            )
          ]),
      // content: const Text(
      //   "Login first to start any quiz",
      //   style: TextStyle(color: textColorHeading, fontSize: 16),
      // ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColorG,
              primary: const Color.fromARGB(255, 215, 202, 202)),
          onPressed: onTap,
          child: const Text(
            "Ok",
            style: TextStyle(fontSize: 16),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColorG,
              primary: const Color.fromARGB(255, 215, 202, 202)),
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
