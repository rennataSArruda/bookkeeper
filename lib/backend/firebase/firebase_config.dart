import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBrQzpuJGTrFYMoZo52Ndcq2Ej2jYjodf8",
            authDomain: "bookkeeper-8680b.firebaseapp.com",
            projectId: "bookkeeper-8680b",
            storageBucket: "bookkeeper-8680b.appspot.com",
            messagingSenderId: "429146348251",
            appId: "1:429146348251:web:4ba0726fa2b0ea3e7b8afe"));
  } else {
    await Firebase.initializeApp();
  }
}
