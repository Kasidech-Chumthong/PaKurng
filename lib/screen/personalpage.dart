import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/screen/loginscreen.dart';
import 'package:pakrung/screen/resetpasswordpage.dart';

import '../firebase/hambergerbar.dart'; // Import ResetPasswordPage

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current user
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      endDrawer: const Navbar(),
      appBar: AppBar(
        title: const Text('Personal Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment: CrossAxisAlignment
              .center, // Align text to the center horizontally
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.white54,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/icon.jpg'),
              ),
            ),


            const SizedBox(
                height: 20), // Add space between avatar and welcome text
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (user != null)
              Column(
                mainAxisAlignment:
                MainAxisAlignment.center, // Center the content vertically
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Align text to the center horizontally
                children: [
                  Text(
                    'Email: ${user.email}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _resetPassword(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0), // Adjust the horizontal padding
                      child: SizedBox(
                        // Wrap with SizedBox to adjust size
                        height: 40, // Set the height of the SizedBox
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the content horizontally
                          children: [
                            Icon(Icons.lock), // Add lock icon
                            SizedBox(
                                width: 8), // Add space between icon and text
                            Text(
                              'Reset Password',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign
                                  .center, // Align the text to the center
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                      10), // Add space between reset password and logout button
                  ElevatedButton(
                      onPressed: () {
                        _signOut(context);
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                ],
              )
            else
              const Text(
                'User not logged in', // Display this message if no user is logged in
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to login screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      print('Sign out error: $e');
      // Handle sign out errors here
    }
  }

  void _resetPassword(BuildContext context) {
    print('Reset Password pressed!');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ResetPasswordPage()));
  }
}