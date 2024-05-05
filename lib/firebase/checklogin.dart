import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pakrung/screen/loginscreen.dart';

void checkLoginStatus(BuildContext context) {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      showLoginAlert(context);
    }
  });
}

void showLoginAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("กรุณาเข้าสู่ระบบ"),
      content: const Text("คุณต้องเข้าสู่ระบบเพื่อใช้งานแอปพลิเคชัน"),
      actions: [
        TextButton(
          onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen())
            );
          },
          child: const Text("เข้าสู่ระบบ"),
        ),
      ],
    ),
  );
}
