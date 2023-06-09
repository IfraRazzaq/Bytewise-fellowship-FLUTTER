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
    apiKey: 'AIzaSyBytmwfYMBQpZ958eQDAU2oeAgg2OVNm3E',
    appId: '1:632218770761:web:d4bdaf4502da8ef9f54e98',
    messagingSenderId: '632218770761',
    projectId: 'ifrahdev-ef13a',
    authDomain: 'ifrahdev-ef13a.firebaseapp.com',
    storageBucket: 'ifrahdev-ef13a.appspot.com',
    measurementId: 'G-48L5BQB4DS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDruO03WZi9Xd5Hbn0rOSp51lanwn8qIEQ',
    appId: '1:632218770761:android:4a8ec5b5d74d63dcf54e98',
    messagingSenderId: '632218770761',
    projectId: 'ifrahdev-ef13a',
    storageBucket: 'ifrahdev-ef13a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaXZXq4s9iK-kphHXnpKb6Uw1vJfh8X9o',
    appId: '1:632218770761:ios:635026ebe87dc7aaf54e98',
    messagingSenderId: '632218770761',
    projectId: 'ifrahdev-ef13a',
    storageBucket: 'ifrahdev-ef13a.appspot.com',
    iosClientId: '632218770761-74mmevfem0v2i77chch4mj0p8ed6atug.apps.googleusercontent.com',
    iosBundleId: 'com.example.bytwiseFinalproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaXZXq4s9iK-kphHXnpKb6Uw1vJfh8X9o',
    appId: '1:632218770761:ios:635026ebe87dc7aaf54e98',
    messagingSenderId: '632218770761',
    projectId: 'ifrahdev-ef13a',
    storageBucket: 'ifrahdev-ef13a.appspot.com',
    iosClientId: '632218770761-74mmevfem0v2i77chch4mj0p8ed6atug.apps.googleusercontent.com',
    iosBundleId: 'com.example.bytwiseFinalproject',
  );
}
