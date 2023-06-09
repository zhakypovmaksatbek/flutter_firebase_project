// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyBWippI7DBAje8tQsZVDEDG9IQBX54P3jg',
    appId: '1:1055602088705:web:d23b71432955098be05900',
    messagingSenderId: '1055602088705',
    projectId: 'flutter-full-news-a9517',
    authDomain: 'flutter-full-news-a9517.firebaseapp.com',
    storageBucket: 'flutter-full-news-a9517.appspot.com',
    measurementId: 'G-S3BCZ8XPLS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2_kZAO-LuBxxCzXqM1gnMjKsNV51DLGI',
    appId: '1:1055602088705:android:b0fc6ea77abb979de05900',
    messagingSenderId: '1055602088705',
    projectId: 'flutter-full-news-a9517',
    storageBucket: 'flutter-full-news-a9517.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBATgv0Yk98F0sv15haMMOJQ_9rBJ1KWio',
    appId: '1:1055602088705:ios:411c32b2125f3a69e05900',
    messagingSenderId: '1055602088705',
    projectId: 'flutter-full-news-a9517',
    storageBucket: 'flutter-full-news-a9517.appspot.com',
    iosClientId:
        '1055602088705-2gub9n546rs3bpgk1qsntebsbogcs43k.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBATgv0Yk98F0sv15haMMOJQ_9rBJ1KWio',
    appId: '1:1055602088705:ios:411c32b2125f3a69e05900',
    messagingSenderId: '1055602088705',
    projectId: 'flutter-full-news-a9517',
    storageBucket: 'flutter-full-news-a9517.appspot.com',
    iosClientId:
        '1055602088705-2gub9n546rs3bpgk1qsntebsbogcs43k.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseProject',
  );
}
