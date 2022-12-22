import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDMjn0hNEmG6nNDlsXmgtvDsEKtY-HM6Jo",
            authDomain: "digital-factory-2747f.firebaseapp.com",
            projectId: "digital-factory-2747f",
            storageBucket: "digital-factory-2747f.appspot.com",
            messagingSenderId: "31365015095",
            appId: "1:31365015095:web:4efb3b7e02900cae5941b2"));
  } else {
    await Firebase.initializeApp();
  }
}
