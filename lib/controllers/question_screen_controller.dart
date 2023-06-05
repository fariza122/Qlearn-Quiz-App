import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:learning_app/controllers/question_paper/q_paper_controller.dart';
import 'package:learning_app/firebase_refrences/loading_status.dart';
import 'package:learning_app/models/question_paper_model.dart';
import 'package:learning_app/screens/home/home_screen.dart';
import 'package:learning_app/screens/questions/result_screen.dart';

import '../firebase_refrences/refrences.dart';

class QScreenController extends GetxController {
  late QuestionPaperModel qPaperModel;
  final allQuesAndAns = <Questions>[];
  final loadingStatus = LoadingStatus.loading.obs;
  final qIndex = 0.obs;
  bool get isFirstQ => qIndex.value > 0;
  bool get isLastQ => qIndex.value >= allQuesAndAns.length - 1;
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  int remainingSeconds = 1;
  Timer? _timer;
  final time = '00.00'.obs;

  @override
  void onReady() {
    final _quizController = Get.arguments as QuestionPaperModel;
    // print(_quizController.title);
    loadData(_quizController);
    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel qPaper) async {
    qPaperModel = qPaper;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> qQuery =
          await qPaperRf.doc(qPaper.id).collection("questions").get();
      final qList = qQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();
      qPaper.questions = qList;

      for (Questions question in qPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answerQuery = await qPaperRf
            .doc(qPaper.id)
            .collection("questions")
            .doc(question.id)
            .collection("answers")
            .get();

        final ansList =
            answerQuery.docs.map((snap) => Answers.fromSnapshot(snap)).toList();
        question.answers = ansList;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    if (qPaper.questions != null && qPaper.questions!.isNotEmpty) {
      allQuesAndAns.assignAll(qPaper.questions!);
      currentQuestion.value = qPaper.questions![0];
      _startTimer(qPaper.timeSeconds);
      // print(qPaper.questions![0].question);
      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void selectedAnswer(String? ans) {
    currentQuestion.value!.selectedAnswer = ans;
    update(["ans_list"]);
  }

  String get completedQuiz {
    final attemptedQs = allQuesAndAns
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return "$attemptedQs out of ${allQuesAndAns.length} answered";
  }

  String get uncompletedQuiz {
    final nonAttempted = allQuesAndAns
        .where((element) => element.selectedAnswer == null)
        .toList()
        .length;
    return "$nonAttempted";
  }

  jumpToQuestion(int index, {bool goToQ = true}) {
    qIndex.value = index;
    currentQuestion.value = allQuesAndAns[index];
    if (goToQ) {
      Get.back();
    }
  }

  void nextQuestion() {
    if (qIndex.value >= allQuesAndAns.length - 1) return;
    qIndex.value++;
    currentQuestion.value = allQuesAndAns[qIndex.value];
  }

  void prevQuestion() {
    if (qIndex.value <= 0) return;
    qIndex.value--;
    currentQuestion.value = allQuesAndAns[qIndex.value];
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")} : ${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }

  onCompletingQuiz() {
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routeName);
  }

  void navigateToHomeScreen() {
    _timer!.cancel();
    Get.offNamedUntil(HomeScreen.routName, (route) => false);
  }

  void tryAgain() {
    Get.find<QPaperController>()
        .checkingIfUserLoggedIn(paper: qPaperModel, tryAgain: true);
  }
}
