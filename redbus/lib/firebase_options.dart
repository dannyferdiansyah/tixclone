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
    apiKey: 'AIzaSyCFQr3Y4K4vGt_la0gHhYakILMKDzkJrq0',
    appId: '1:118832359078:web:a75ea83e677f76a630f667',
    messagingSenderId: '118832359078',
    projectId: 'redbus-ac45f',
    authDomain: 'redbus-ac45f.firebaseapp.com',
    storageBucket: 'redbus-ac45f.appspot.com',
    measurementId: 'G-2CTB5V9HYL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAatwshmznJRoc8zSPNRj42GA6bBUxssoc',
    appId: '1:118832359078:android:c78f387104ccf26530f667',
    messagingSenderId: '118832359078',
    projectId: 'redbus-ac45f',
    storageBucket: 'redbus-ac45f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2APLPLcE2eC6XZ379gVSj8piNOKemqNo',
    appId: '1:118832359078:ios:26c2c18b332e0f2f30f667',
    messagingSenderId: '118832359078',
    projectId: 'redbus-ac45f',
    storageBucket: 'redbus-ac45f.appspot.com',
    iosClientId: '118832359078-ejs3cfftevb5pl1hpsntd6va4h9d70cf.apps.googleusercontent.com',
    iosBundleId: 'com.example.redbus',
  );
}
