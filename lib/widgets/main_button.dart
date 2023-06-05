import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? child;
  final String title;
  final bool enabled;
  const MainButton(
      {this.title = '',
      this.enabled = true,
      this.child,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider yellowButton =
        const AssetImage("assets/images/bg_canva_yellow.png");
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.065,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Container(
            width: double.maxFinite,
            // height: MediaQuery.of(context).size.height * 0.065,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: yellowButton, fit: BoxFit.cover)),
            child: child ??
                Center(
                    child: Text(
                  // controller.loadingStatus.value == LoadingStatus.loading ?

                  title,
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: primaryColorG),
                )),
          ),
        ),
      ),
    );
  }
}
