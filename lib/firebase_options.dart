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
    apiKey: 'AIzaSyBNEsoeRict_-NojGgzgQBTsDqlKkIaJps',
    appId: '1:782501450352:web:b0a0411df21fa3b261dab5',
    messagingSenderId: '782501450352',
    projectId: 'birdi-9a147',
    authDomain: 'birdi-9a147.firebaseapp.com',
    storageBucket: 'birdi-9a147.appspot.com',
    measurementId: 'G-JKTPNCWQCS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjvnxl6Ci6JDofvZGRrDo7qTcETDugG64',
    appId: '1:782501450352:android:15955a394cd47d5d61dab5',
    messagingSenderId: '782501450352',
    projectId: 'birdi-9a147',
    storageBucket: 'birdi-9a147.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM4HybypaS2sDT8tZn5AkATzrR7PgeW7U',
    appId: '1:782501450352:ios:653eab036348a08761dab5',
    messagingSenderId: '782501450352',
    projectId: 'birdi-9a147',
    storageBucket: 'birdi-9a147.appspot.com',
    iosClientId: '782501450352-it8ghv49q5bcacu0foqv7acfud10dm9c.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAM4HybypaS2sDT8tZn5AkATzrR7PgeW7U',
    appId: '1:782501450352:ios:653eab036348a08761dab5',
    messagingSenderId: '782501450352',
    projectId: 'birdi-9a147',
    storageBucket: 'birdi-9a147.appspot.com',
    iosClientId: '782501450352-it8ghv49q5bcacu0foqv7acfud10dm9c.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileFinal',
  );
}