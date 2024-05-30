import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB3Vzr7xUtHb7nzP30FR_5zEQkfIffhOyM",
            authDomain: "unicollab-f6e1e.firebaseapp.com",
            projectId: "unicollab-f6e1e",
            storageBucket: "unicollab-f6e1e.appspot.com",
            messagingSenderId: "766571657463",
            appId: "1:766571657463:web:437e77a7e9bcfbb2cf7bf2",
            measurementId: "G-8CV8W2QX31"));
  } else {
    await Firebase.initializeApp();
  }
}
