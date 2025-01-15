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
    apiKey: 'AIzaSyCy-pcmyx-eFlf3P9rOcXh7UfBKnazh9Mg',
    appId: '1:598605918636:web:8b23a562e74d1466d18a09',
    messagingSenderId: '598605918636',
    projectId: 'domasno-1',
    authDomain: 'domasno-1.firebaseapp.com',
    storageBucket: 'domasno-1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD95Dt9wM7U9s7f9QzrPu4LM4g43sN5S5I',
    appId: '1:598605918636:android:53a069c22d71c736d18a09',
    messagingSenderId: '598605918636',
    projectId: 'domasno-1',
    storageBucket: 'domasno-1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsGUdNE_F3eFEILIGelEDCjWBEOwvKe0k',
    appId: '1:598605918636:ios:04c0d038a16f0513d18a09',
    messagingSenderId: '598605918636',
    projectId: 'domasno-1',
    storageBucket: 'domasno-1.firebasestorage.app',
    iosBundleId: 'com.example.domasna1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsGUdNE_F3eFEILIGelEDCjWBEOwvKe0k',
    appId: '1:598605918636:ios:04c0d038a16f0513d18a09',
    messagingSenderId: '598605918636',
    projectId: 'domasno-1',
    storageBucket: 'domasno-1.firebasestorage.app',
    iosBundleId: 'com.example.domasna1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCy-pcmyx-eFlf3P9rOcXh7UfBKnazh9Mg',
    appId: '1:598605918636:web:a85bc013a697ed16d18a09',
    messagingSenderId: '598605918636',
    projectId: 'domasno-1',
    authDomain: 'domasno-1.firebaseapp.com',
    storageBucket: 'domasno-1.firebasestorage.app',
  );
}
