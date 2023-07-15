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
    apiKey: 'AIzaSyBprNu26MO6HV_XmDs8GNae3aAqhyYwi7g',
    appId: '1:900810597451:web:33bf266f883d4ab4e659ce',
    messagingSenderId: '900810597451',
    projectId: 'trashbanker',
    authDomain: 'trashbanker.firebaseapp.com',
    storageBucket: 'trashbanker.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrV1sJYZ911xtqwg0Wzbyv9K7lQmxNLcc',
    appId: '1:900810597451:android:3f9c716c114a6816e659ce',
    messagingSenderId: '900810597451',
    projectId: 'trashbanker',
    storageBucket: 'trashbanker.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqYXD5b2MD-G3wdn3PVW9xMOjoHsD0weU',
    appId: '1:900810597451:ios:b42d9b1d33741d35e659ce',
    messagingSenderId: '900810597451',
    projectId: 'trashbanker',
    storageBucket: 'trashbanker.appspot.com',
    iosClientId: '900810597451-tu6r9shpboq3usm3b8585calg4uvv7te.apps.googleusercontent.com',
    iosBundleId: 'com.example.trashbanker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqYXD5b2MD-G3wdn3PVW9xMOjoHsD0weU',
    appId: '1:900810597451:ios:691168104aea1a13e659ce',
    messagingSenderId: '900810597451',
    projectId: 'trashbanker',
    storageBucket: 'trashbanker.appspot.com',
    iosClientId: '900810597451-ivcn078fuabt4630kro34c5gi5e7ud6k.apps.googleusercontent.com',
    iosBundleId: 'com.example.trashbanker.RunnerTests',
  );
}