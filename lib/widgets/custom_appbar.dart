import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning_app/configs/app_icons.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/screens/questions/quiz_overview_screen.dart';
import 'package:learning_app/widgets/app_circle_button.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuTap;
  final bool showMenuIcon;
  final Widget? titleWidget;
  final Widget? leading;

  const CustomAppbar(
      {this.onMenuTap,
      this.title = '',
      this.showMenuIcon = false,
      this.leading,
      this.titleWidget,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Positioned.fill(
            child: titleWidget == null
                ? Center(child: Text(title))
                : Center(child: titleWidget)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading ??
                Transform.translate(
                  offset: const Offset(-14, 0),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: BackButton(
                      color: primaryColorY,
                    ),
                  ),
                ),
            if (showMenuIcon)
              Transform.translate(
                offset: const Offset(10, 0),
                child: AppCircleButton(
                  onTap: onMenuTap ??
                      //toNamed() keep the prvious page and state same
                      () => Get.toNamed(QuizOverviewScreen.routeName),
                  shadow: false,
                  child: const Icon(
                    AppIcons.menuRight,
                    color: primaryColorY,
                  ),
                ),
              )
          ],
        )
      ],
    ));
  }

  @override
  Size get preferredSize => Size(double.maxFinite, Get.height * 0.25);
  IconThemeData get iconTheme => const IconThemeData(color: primaryColorY);
}
