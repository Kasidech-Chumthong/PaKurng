import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  labelStyle: const TextStyle(color: Colors.black),
                  filled: true, // เพิ่ม filled เป็น true เพื่อให้มีพื้นหลังสี
                  fillColor: Colors.white, // กำหนดสีพื้นหลังให้เป็นสีขาว
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black, // กำหนดสีให้กับ icon email
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(
                      12.0, 16.0, 12.0, 16.0), // ปรับระยะห่างบน-ขวา-ล่าง-ซ้าย
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // กำหนดความโค้งของเส้นขอบ
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _resetPassword(context);
                },
                child: const Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword(BuildContext context) async {
    try {
      String email = _emailController.text;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Show success message or navigate to login screen
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Reset Password',
            ),
            content: Text('Password reset email has been sent to $email'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pop(); // Close the forgot password screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      // Show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to send password reset email'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
