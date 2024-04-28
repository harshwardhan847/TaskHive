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
    apiKey: 'AIzaSyA9pz9TAxLHj0mBRNF1Isq3rVv0orABstU',
    appId: '1:1022520673035:web:c29ce07a3ea3557153980e',
    messagingSenderId: '1022520673035',
    projectId: 'taskhiveofficial',
    authDomain: 'taskhiveofficial.firebaseapp.com',
    storageBucket: 'taskhiveofficial.appspot.com',
    measurementId: 'G-YWJ3LBSHKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOHDY1PASGveFPefhNCkMcWEMuxDKkK7I',
    appId: '1:1022520673035:android:b38df1ab3a0238d453980e',
    messagingSenderId: '1022520673035',
    projectId: 'taskhiveofficial',
    storageBucket: 'taskhiveofficial.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_r_9VnSY_Jz6DKoRySoB1vyXR_G1yXwU',
    appId: '1:1022520673035:ios:229f360ddc1a612e53980e',
    messagingSenderId: '1022520673035',
    projectId: 'taskhiveofficial',
    storageBucket: 'taskhiveofficial.appspot.com',
    iosBundleId: 'com.example.taskHive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_r_9VnSY_Jz6DKoRySoB1vyXR_G1yXwU',
    appId: '1:1022520673035:ios:229f360ddc1a612e53980e',
    messagingSenderId: '1022520673035',
    projectId: 'taskhiveofficial',
    storageBucket: 'taskhiveofficial.appspot.com',
    iosBundleId: 'com.example.taskHive',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA9pz9TAxLHj0mBRNF1Isq3rVv0orABstU',
    appId: '1:1022520673035:web:35817d246aac408d53980e',
    messagingSenderId: '1022520673035',
    projectId: 'taskhiveofficial',
    authDomain: 'taskhiveofficial.firebaseapp.com',
    storageBucket: 'taskhiveofficial.appspot.com',
    measurementId: 'G-SEZWHLYXSY',
  );

}