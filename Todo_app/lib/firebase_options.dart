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
    apiKey: 'AIzaSyD9IPOJlFtJB0y7Dw4XoBfhPIBZXMqp8c8',
    appId: '1:541563529236:web:1d3926cd7e9744d1eb1f01',
    messagingSenderId: '541563529236',
    projectId: 'fir-todo-app-4a209',
    authDomain: 'fir-todo-app-4a209.firebaseapp.com',
    storageBucket: 'fir-todo-app-4a209.appspot.com',
    measurementId: 'G-9PBG8Q32MV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgnK4pUX35CWOpSzvyGXTQYH0YdSGS9t4',
    appId: '1:541563529236:android:f639f4139581807feb1f01',
    messagingSenderId: '541563529236',
    projectId: 'fir-todo-app-4a209',
    storageBucket: 'fir-todo-app-4a209.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcpM1uT59WLFXbpRIOLEjDSkEX-gTqSiY',
    appId: '1:541563529236:ios:bf56acbad19f3c53eb1f01',
    messagingSenderId: '541563529236',
    projectId: 'fir-todo-app-4a209',
    storageBucket: 'fir-todo-app-4a209.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcpM1uT59WLFXbpRIOLEjDSkEX-gTqSiY',
    appId: '1:541563529236:ios:bf56acbad19f3c53eb1f01',
    messagingSenderId: '541563529236',
    projectId: 'fir-todo-app-4a209',
    storageBucket: 'fir-todo-app-4a209.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9IPOJlFtJB0y7Dw4XoBfhPIBZXMqp8c8',
    appId: '1:541563529236:web:0f15d79a72ebf2feeb1f01',
    messagingSenderId: '541563529236',
    projectId: 'fir-todo-app-4a209',
    authDomain: 'fir-todo-app-4a209.firebaseapp.com',
    storageBucket: 'fir-todo-app-4a209.appspot.com',
    measurementId: 'G-J1YZ43QNV0',
  );
}
