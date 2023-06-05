import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/bindings/initial_bindings.dart';
import 'package:learning_app/firebase_options.dart';
import 'package:get/get.dart';
import 'package:learning_app/routes/app_routes.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initFirebase();
  InitialBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  //   androidProvider: AndroidProvider.debug,
  // );
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/introBg.png"), context);
    precacheImage(const AssetImage("assets/images/bg_canva.png"), context);
    precacheImage(const AssetImage("assets/images/splash_bg3.jpg"), context);
    precacheImage(const AssetImage("assets/images/bg_canva_y.png"), context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes(),
    );
  }
}
