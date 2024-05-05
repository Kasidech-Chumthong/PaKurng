import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication
import 'package:pakrung/home.dart';
import 'package:pakrung/screen/forgotpassword.dart';
import 'package:pakrung/screen/registerpage.dart'; // Import RegisterScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true; // State to track if password is obscured or not
  double _imagePosition = 0; // New state for image position

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
          child: Stack(
            // Use Stack to overlay the CircleAvatar
            children: [
              Transform.translate(
                offset: const Offset(0, -20), // Move the content up by 20 pixels
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ), // Add padding for text input
                      decoration: BoxDecoration(
                        color:
                        Colors.white, // Set background color of the container
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ), // Add border radius to create rounded corners
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: InputBorder
                              .none, // Remove border of the input field
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Add spacing between text fields
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure, // Use _isObscure state
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            // Add suffix icon button to toggle password visibility
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure =
                                !_isObscure; // Toggle _isObscure state
                              });
                            },
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                        10), // Add spacing between password field and forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            _navigateToForgotpassword();
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        const SizedBox(width: 90), // Adjust the width as needed
                      ],
                    ),
                    const SizedBox(height: 2), // Add spacing between text fields
                    ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                        height:
                        10), // Add spacing between the Login button and the text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "If you don't have an account yet",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const RegistrationScreen(), // ชื่อของหน้าการลงทะเบียน
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _navigateToForgotpassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }

  void _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      // Sign in with email and password
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login success, navigate to next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } catch (error) {
      // Handle sign inerrors here
      print('Login error: $error');
      // Show an alert dialog or snackbar to indicate login failure
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Incorrect email or password.'),
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

    // Move the image up and down
    setState(() {
      _imagePosition -= 50;
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _imagePosition += 50;
        });
      });
    });
  }
}