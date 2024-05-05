import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final hasUppercase = RegExp(r'[A-Z]');
  final hasDigits = RegExp(r'\d');

  bool _oldPasswordObscure = true;
  bool _newPasswordObscure = true;
  bool _confirmPasswordObscure = true;

  String? _errorMessage;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: _buildPasswordTextField(
                  controller: _oldPasswordController,
                  labelText: 'Old Password',
                  obscureText: _oldPasswordObscure,
                  onPressed: () {
                    setState(() {
                      _oldPasswordObscure = !_oldPasswordObscure;
                    });
                  },
                ),
              ),
              ListTile(
                title: _buildPasswordTextField(
                  controller: _newPasswordController,
                  labelText: 'New Password',
                  obscureText: _newPasswordObscure,
                  onPressed: () {
                    setState(() {
                      _newPasswordObscure = !_newPasswordObscure;
                    });
                  },
                ),
              ),
              ListTile(
                title: _buildPasswordTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm New Password',
                  obscureText: _confirmPasswordObscure,
                  onPressed: () {
                    setState(() {
                      _confirmPasswordObscure = !_confirmPasswordObscure;
                    });
                  },
                ),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: _resetPassword,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.black, // เปลี่ยนสีตัวอักษรเป็นสีดำ
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _buildPasswordTextField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    required VoidCallback onPressed,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        if (labelText == 'Confirm New Password' &&
            value != _newPasswordController.text) {
          return 'Passwords do not match';
        }
        if (!hasUppercase.hasMatch(value) ||
            !hasSpecialCharacters.hasMatch(value) ||
            !hasDigits.hasMatch(value)) {
          return 'Password must contain at least one uppercase letter, one digit, and one special character ';
        }
        return null;
      },
    );
  }

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Reauthenticate user with old password
          AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!,
            password: _oldPasswordController.text,
          );
          await user.reauthenticateWithCredential(credential);

          // Change password
          await user.updatePassword(_newPasswordController.text);

          // Reset form and show success message
          _formKey.currentState!.reset();
          setState(() {
            _errorMessage = null;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password updated successfully'),
            ),
          );

          // Navigate back to PersonalPage
          Navigator.pop(context);
        }
      } catch (e) {
        print('Error updating password: $e');
        setState(() {
          _errorMessage = 'Error updating password. Please try again.';
        });
      }
    }
  }
}
