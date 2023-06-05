import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:learning_app/controllers/auth_controller.dart';
import 'package:learning_app/models/question_paper_model.dart';
import 'package:learning_app/screens/questions/questions_screen.dart';
import 'package:learning_app/services/firebase_storage_service.dart';

import '../../firebase_refrences/refrences.dart';

class QPaperController extends GetxController {
  final allImagePath = <String>[].obs;
  final allImages = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getImagesPath();
    super.onReady();
  }

  Future<void> getImagesPath() async {
    List<String> imgName = ['biology', 'chemistry', 'maths', 'physics'];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await qPaperRf.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allImages.assignAll(paperList);

      for (var paper in paperList) {
        final imgPath =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgPath;
        // allImagePath.add(imgPath!);
      }
      allImages.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void checkingIfUserLoggedIn(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        Get.offNamed(QuestionsScreen.routeName,
            arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
      }
    } else {
      // print("This is title ${paper.title}");
      _authController.showLoginAlert();
    }
  }
}
