import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final qPaperRf = fireStore.collection("questionPapers");
final userRf = fireStore.collection("users");

DocumentReference questionsRf(
        {required String paperId, required String questionId}) =>
    qPaperRf.doc(paperId).collection("questions").doc(questionId);
DocumentReference answerRf(
        {required String paperId,
        required String questionId,
        required String answerId}) =>
    qPaperRf
        .doc(paperId)
        .collection("questions")
        .doc(questionId)
        .collection("answers")
        .doc(answerId);

Reference get firebaseStorageRef => FirebaseStorage.instance.ref();
