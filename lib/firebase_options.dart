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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPXP6I-VkV-If_DEjWdE_hX2iJgefxmoQ',
    appId: '1:148148774818:android:a2066f66ebef2c798c74fb',
    messagingSenderId: '148148774818',
    projectId: 'ecommerce1-9a5a5',
    databaseURL: 'https://ecommerce1-9a5a5-default-rtdb.firebaseio.com',
    storageBucket: 'ecommerce1-9a5a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlaNnsrMFP4XDByF7crTt-xIAM9aH9vuw',
    appId: '1:148148774818:ios:94627951ba198ed98c74fb',
    messagingSenderId: '148148774818',
    projectId: 'ecommerce1-9a5a5',
    databaseURL: 'https://ecommerce1-9a5a5-default-rtdb.firebaseio.com',
    storageBucket: 'ecommerce1-9a5a5.appspot.com',
    iosClientId: '148148774818-vm4sng5cvdgi0bj29msv5696jkv7a5pf.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}
