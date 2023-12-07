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
        return macos;
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
    apiKey: 'AIzaSyA8fIT6Tydk3D1rsRL9od2uH0tvy46cCCA',
    appId: '1:673489794832:web:9778f81f223270170c1795',
    messagingSenderId: '673489794832',
    projectId: 'chatter-e4048',
    authDomain: 'chatter-e4048.firebaseapp.com',
    storageBucket: 'chatter-e4048.appspot.com',
    measurementId: 'G-ZD4LWHXR1T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA70E_45gBUuyNBBOLKOWbS7mQV9Lsz-7M',
    appId: '1:673489794832:android:2e0a4f03d199a9620c1795',
    messagingSenderId: '673489794832',
    projectId: 'chatter-e4048',
    storageBucket: 'chatter-e4048.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwJMewjOJKFUOIdF9iwLWYtRmvtpI0Cxo',
    appId: '1:673489794832:ios:c9f238f84878316b0c1795',
    messagingSenderId: '673489794832',
    projectId: 'chatter-e4048',
    storageBucket: 'chatter-e4048.appspot.com',
    iosBundleId: 'com.example.chatter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwJMewjOJKFUOIdF9iwLWYtRmvtpI0Cxo',
    appId: '1:673489794832:ios:204497b1a1691f1d0c1795',
    messagingSenderId: '673489794832',
    projectId: 'chatter-e4048',
    storageBucket: 'chatter-e4048.appspot.com',
    iosBundleId: 'com.example.chatter.RunnerTests',
  );
}
