import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/colors.dart';
import 'package:learning_app/controllers/zoom_drawer_controller.dart';

class MyMenuScreen extends GetView<ZoomDController> {
  const MyMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider bgMain2 =
        const AssetImage("assets/images/bg_canva_yellow.png");
    var profileImage = controller.user.value?.photoURL ??
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/HD_transparent_picture.png/1280px-HD_transparent_picture.png';
    return Container(
      padding: const EdgeInsets.all(30.0),
      width: double.maxFinite,
      // height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
          // color: primaryColorG,
          image:
              DecorationImage(image: bgMain2, fit: BoxFit.cover, opacity: 0.8)),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 30,
              top: 0,
              child: BackButton(
                color: primaryColorG,
                onPressed: () {
                  controller.toggleDrawer();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Obx(() => controller.user.value == null
                      ? const SizedBox()
                      : Text(
                          controller.user.value!.displayName ?? '',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: primaryColorG),
                        )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      backgroundImage: NetworkImage(profileImage),
                    ),
                  ),
                  DrawerButton(
                    icon: Icons.web_rounded,
                    label: "Our Website",
                    color: primaryColorG,
                    onTap: () => controller.website(),
                  ),
                  DrawerButton(
                    icon: Icons.email,
                    label: "Email us",
                    color: primaryColorG,
                    onTap: () => controller.email(),
                  ),
                  DrawerButton(
                    icon: Icons.gavel,
                    label: "Github link to the App",
                    color: primaryColorG,
                    onTap: () => controller.email(),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Obx(() => controller.user.value == null
                      ? Container(
                          width: Get.width * 0.3,
                          height: Get.width * 0.09,
                          decoration: BoxDecoration(
                              color: primaryColorG,
                              borderRadius: BorderRadius.circular(12)),
                          child: DrawerButton(
                            icon: Icons.login,
                            label: "Login",
                            color: primaryColorY,
                            onTap: () => controller.navigateTologinPage(),
                          ),
                        )
                      : Container(
                          width: Get.width * 0.3,
                          height: Get.width * 0.09,
                          decoration: BoxDecoration(
                              color: primaryColorG,
                              borderRadius: BorderRadius.circular(12)),
                          child: DrawerButton(
                            icon: Icons.logout,
                            label: "Logout",
                            color: primaryColorY,
                            onTap: () => controller.signOut(),
                          ),
                        ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String label;
  final Color color;
  const DrawerButton(
      {Key? key,
      required this.icon,
      required this.label,
      this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, size: 17, color: color),
      onPressed: onTap,
      label: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 15,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
