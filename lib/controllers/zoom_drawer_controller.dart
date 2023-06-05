import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:learning_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ZoomDController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void website() {
    _launch("https://www.google.com");
  }

  void signIn() {
    Get.find<AuthController>().signInWithGoogle();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void navigateTologinPage() {
    Get.find<AuthController>().navigateToLoginScreen();
  }

  void email() {
    final Uri _launchUri =
        Uri(scheme: "mailto", path: "farizamohsin122@gmail.com");
    _launch(_launchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw "could not open $url";
    }
  }
}
