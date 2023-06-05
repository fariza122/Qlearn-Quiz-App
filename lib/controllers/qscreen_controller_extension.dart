import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:learning_app/controllers/auth_controller.dart';
import 'package:learning_app/controllers/question_screen_controller.dart';
import 'package:learning_app/firebase_refrences/refrences.dart';

extension QScreenControllerExtension on QScreenController {
  get correctQCount => allQuesAndAns
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  Future<void> saveUserTestHistory() async {
    final batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) {
      return;
    } else {
      batch.set(
          userRf
              .doc(_user.email)
              .collection("attempted_Quiz_history")
              .doc(qPaperModel.id),
          {
            "correct_questions": '$correctQCount/${allQuesAndAns.length}',
            "question_id": qPaperModel.id,
            "time": qPaperModel.timeSeconds - remainingSeconds,
          });
      batch.commit();
      navigateToHomeScreen();
    }
  }
}
