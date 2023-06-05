import 'package:get/get.dart';
import 'package:learning_app/controllers/auth_controller.dart';
import 'package:learning_app/services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => FirebaseStorageService());
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);

    // Get.put(FirebaseStorageService());
  }
}
