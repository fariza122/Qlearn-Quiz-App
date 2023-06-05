import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_app/firebase_refrences/refrences.dart';
import 'package:learning_app/screens/home/home_screen.dart';
import 'package:learning_app/screens/login/login_screen.dart';
import 'package:learning_app/utils/app_logger.dart';

import '../widgets/dialogs/dialog_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroScreen();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credentials = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);
        await _auth.signInWithCredential(_credentials);
        await saveUser(account);
        navigateToHomeScreen();
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRf.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilePic": account.photoUrl
    });
  }

  Future<void> signOut() async {
    AppLogger.d("Log out");
    try {
      await _auth.signOut();
      navigateToHomeScreen();
    } on FirebaseAuthException catch (error) {
      AppLogger.e(error);
    }
  }

  void navigateToHomeScreen() {
    Get.offAllNamed(HomeScreen.routName);
  }

  void navigateToIntroScreen() {
    Get.offAllNamed("/intro_screen");
  }

  void showLoginAlert() {
    Get.dialog(
      Dialogs.alertDialogForlogin(onTap: () {
        Get.back();
        navigateToLoginScreen();
      }),
      barrierDismissible: false,
    );
  }

  void navigateToLoginScreen() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
