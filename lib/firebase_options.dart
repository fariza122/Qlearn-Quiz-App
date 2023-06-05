// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBz8X9_SHsuGzO4HtJfPNYRyNfIyyHIqPA',
    appId: '1:13760402833:web:ca5a045472c8474ac83630',
    messagingSenderId: '13760402833',
    projectId: 'learning-app-e79bb',
    authDomain: 'learning-app-e79bb.firebaseapp.com',
    storageBucket: 'learning-app-e79bb.appspot.com',
    measurementId: 'G-VZH4BMXG25',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMl_EyTPEgzovKG65ziOJpYe6qbmWC0RM',
    appId: '1:13760402833:android:52eb125c171415f9c83630',
    messagingSenderId: '13760402833',
    projectId: 'learning-app-e79bb',
    storageBucket: 'learning-app-e79bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDF-9UI4cXhG1X7fNrdnmL6LcCSMH-zB2M',
    appId: '1:13760402833:ios:6465d5cd33d69f3ec83630',
    messagingSenderId: '13760402833',
    projectId: 'learning-app-e79bb',
    storageBucket: 'learning-app-e79bb.appspot.com',
    iosClientId: '13760402833-ksc3omsm5aq2053g5f3ogin15fbp601j.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningApp',
  );
}