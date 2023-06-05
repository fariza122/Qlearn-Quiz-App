import 'package:get/get.dart';
import '../firebase_refrences/refrences.dart';

// Reference get firebaseStorageRef =>
//     FirebaseStorage.instance.refFromURL("gs://learning-app-e79bb.appspot.com/");

class FirebaseStorageService extends GetxService {
  Future<String> getImage(String imgName) async {
    // if (imgName == null) {
    //   return null;
    // }
    try {
      var urlRef = firebaseStorageRef
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();

      return imgUrl;
    } catch (e) {
      return "";
    }
  }
}
