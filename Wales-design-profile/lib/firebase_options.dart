// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDqo95V5uPgRUK1JgM5lp8mJTtXIRMUs4Q',
    appId: '1:1030343360675:web:ec82f3a79f87508161bf16',
    messagingSenderId: '1030343360675',
    projectId: 'whales-fc802',
    authDomain: 'whales-fc802.firebaseapp.com',
    storageBucket: 'whales-fc802.appspot.com',
    measurementId: 'G-PD0T0XSC1M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA50NjVkwDNckRvYtLY964AAcYxglqRVes',
    appId: '1:1030343360675:android:29706028b894348561bf16',
    messagingSenderId: '1030343360675',
    projectId: 'whales-fc802',
    storageBucket: 'whales-fc802.appspot.com',
  );

}