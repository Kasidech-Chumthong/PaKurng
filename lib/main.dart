import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pakrung/firebase/market1.dart';
import 'package:pakrung/screen/loginscreen.dart';
import 'package:pakrung/screen/personalpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAEnoSdOHTAw1Cy-gpc0ntCJ9RjVr2TbSk",
      appId: "1:341667687939:android:b7bb4dea5ad035f5b92836",
      projectId: "mobileappyear2-a9d58",
      messagingSenderId: "341667687939",
    ),
  );
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'PK'),
    home: LoginScreen(),
  ));
}