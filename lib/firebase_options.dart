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
    apiKey: 'AIzaSyAaZ0oFF1Y3vCJBCA6U8lZ6Ufe_fQfaPTE',
    appId: '1:293887307215:web:d0500dbde8c1a028f8f6ba',
    messagingSenderId: '293887307215',
    projectId: 'gemglow-11a7a',
    authDomain: 'gemglow-11a7a.firebaseapp.com',
    databaseURL: 'https://gemglow-11a7a-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'gemglow-11a7a.appspot.com',
    measurementId: 'G-EQ91993SFB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYjHLUs7m-wEeVK2D0DHLP-3WDQy07B0k',
    appId: '1:293887307215:android:3fad2e8fd9bb9bf4f8f6ba',
    messagingSenderId: '293887307215',
    projectId: 'gemglow-11a7a',
    databaseURL: 'https://gemglow-11a7a-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'gemglow-11a7a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAL4q3PFddaGgpiRIlEN4W2tPz4G6o_aW8',
    appId: '1:293887307215:ios:6ee3c8a1e8574f09f8f6ba',
    messagingSenderId: '293887307215',
    projectId: 'gemglow-11a7a',
    databaseURL: 'https://gemglow-11a7a-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'gemglow-11a7a.appspot.com',
    androidClientId: '293887307215-t9h99cpg74k6bld7katj5unjpsdmcjb1.apps.googleusercontent.com',
    iosClientId: '293887307215-er31hasu9b15k3hdk57tjmr2ge5jbv66.apps.googleusercontent.com',
    iosBundleId: 'com.example.gemglow',
  );
}
