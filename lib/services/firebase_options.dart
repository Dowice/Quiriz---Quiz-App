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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDy9PmZCzAtL7i_EMwqxr3srL30YBOu7nM',
    appId: '1:288260010139:web:be15d14373c8ad8135163e',
    messagingSenderId: '288260010139',
    projectId: 'quiriz-85c55',
    authDomain: 'quiriz-85c55.firebaseapp.com',
    storageBucket: 'quiriz-85c55.appspot.com',
    measurementId: 'G-X2QHCD7PFF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACrwS3HuKcciSgqIrLXGiCIyIzev2NWao',
    appId: '1:288260010139:android:de5d8f310ffc4c0935163e',
    messagingSenderId: '288260010139',
    projectId: 'quiriz-85c55',
    storageBucket: 'quiriz-85c55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxqSun2vcsLsnN9d64PHy-igMc5GlgCzk',
    appId: '1:288260010139:ios:a7b16d4405d7bc9d35163e',
    messagingSenderId: '288260010139',
    projectId: 'quiriz-85c55',
    storageBucket: 'quiriz-85c55.appspot.com',
    iosBundleId: 'com.example.quiriz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxqSun2vcsLsnN9d64PHy-igMc5GlgCzk',
    appId: '1:288260010139:ios:a7b16d4405d7bc9d35163e',
    messagingSenderId: '288260010139',
    projectId: 'quiriz-85c55',
    storageBucket: 'quiriz-85c55.appspot.com',
    iosBundleId: 'com.example.quiriz',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDy9PmZCzAtL7i_EMwqxr3srL30YBOu7nM',
    appId: '1:288260010139:web:00d4400b5d0da01f35163e',
    messagingSenderId: '288260010139',
    projectId: 'quiriz-85c55',
    authDomain: 'quiriz-85c55.firebaseapp.com',
    storageBucket: 'quiriz-85c55.appspot.com',
    measurementId: 'G-254D5G27E4',
  );
}
