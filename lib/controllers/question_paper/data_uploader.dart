import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learning_app/firebase_refrences/loading_status.dart';
import 'package:learning_app/firebase_refrences/refrences.dart';
import 'package:learning_app/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus =
      LoadingStatus.loading.obs; // LoadingStatus is observable

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; // 0
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file and print the path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    List<QuestionPaperModel> qPapers = [];
    for (var paper in papersInAssets) {
      String paperContent = await rootBundle.loadString(paper);
      qPapers.add(QuestionPaperModel.fromJson(json.decode(paperContent)));
    }
    // print(qPapers.length);
    final batch = fireStore.batch();

    for (var papers in qPapers) {
      batch.set(qPaperRf.doc(papers.id), {
        "title": papers.title,
        "description": papers.description,
        "image_url": papers.imageUrl,
        "time_seconds": papers.timeSeconds,
        "questions_quantity":
            papers.questions == null ? 0 : papers.questions!.length
      });
      for (var questions in papers.questions!) {
        final qPath = questionsRf(paperId: papers.id, questionId: questions.id);
        batch.set(qPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });
        for (var answers in questions.answers) {
          final ansPath = answerRf(
              paperId: papers.id,
              questionId: questions.id,
              answerId: answers.identifier!);
          batch.set(ansPath,
              {"answer": answers.answer, "identifier": answers.identifier});
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed; // 1
  }
}
