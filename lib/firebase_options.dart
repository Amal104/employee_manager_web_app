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
    apiKey: 'AIzaSyBwjC0YZiPvwhiLx27Y6j7Xt1xVFdEij4c',
    appId: '1:237999752841:web:ab22fb72a556c9dcaf6858',
    messagingSenderId: '237999752841',
    projectId: 'employee-manager-web-app-11dee',
    authDomain: 'employee-manager-web-app-11dee.firebaseapp.com',
    storageBucket: 'employee-manager-web-app-11dee.appspot.com',
    measurementId: 'G-ZE7Y8FB5X3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALVTh0XjaepUpLNv3ZYPK1HBXqh1MP-2A',
    appId: '1:237999752841:android:31ae40bbbe967892af6858',
    messagingSenderId: '237999752841',
    projectId: 'employee-manager-web-app-11dee',
    storageBucket: 'employee-manager-web-app-11dee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6iiPDcimAlkFIJXjGOWk6ozpU5naBHHw',
    appId: '1:237999752841:ios:faafdb290115a6deaf6858',
    messagingSenderId: '237999752841',
    projectId: 'employee-manager-web-app-11dee',
    storageBucket: 'employee-manager-web-app-11dee.appspot.com',
    iosBundleId: 'com.example.employeeManagerWeb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6iiPDcimAlkFIJXjGOWk6ozpU5naBHHw',
    appId: '1:237999752841:ios:faafdb290115a6deaf6858',
    messagingSenderId: '237999752841',
    projectId: 'employee-manager-web-app-11dee',
    storageBucket: 'employee-manager-web-app-11dee.appspot.com',
    iosBundleId: 'com.example.employeeManagerWeb',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBwjC0YZiPvwhiLx27Y6j7Xt1xVFdEij4c',
    appId: '1:237999752841:web:70b58c8301f88259af6858',
    messagingSenderId: '237999752841',
    projectId: 'employee-manager-web-app-11dee',
    authDomain: 'employee-manager-web-app-11dee.firebaseapp.com',
    storageBucket: 'employee-manager-web-app-11dee.appspot.com',
    measurementId: 'G-3CG866XGLB',
  );
}