import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBZ6skmeSxRr0sLJOeuJ9KisXglVZUbyJE",
            authDomain: "contaminacion-acustica-d05d8.firebaseapp.com",
            projectId: "contaminacion-acustica-d05d8",
            storageBucket: "contaminacion-acustica-d05d8.appspot.com",
            messagingSenderId: "848612720145",
            appId: "1:848612720145:web:73095a7ea7ac6b84ffbbb0",
            measurementId: "G-VE445PC914"));
  } else {
    await Firebase.initializeApp();
  }
}
