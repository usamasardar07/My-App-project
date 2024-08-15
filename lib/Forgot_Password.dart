import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  static const String id ='ForgotPassword';
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      // Handle empty email case
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    // Here you would normally send the email to your backend API for processing
    // For demonstration, we just show a success message

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset link sent!')),
    );

    // Clear the email field
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(.7),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'FORGOT PASSWORD',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 27),
              child: Text(
                'Your Email',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 27),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please enter your email to reset your Password',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 27, right: 27),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.cyan,
              decoration: const InputDecoration(
                hintText: 'youremail@gmail.com',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _resetPassword,
            child: Container(
              height: 40,

              width: 450, // Make it responsive
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6537EC), // Start color (purple)
                    Color(0xFFDA1A8B), // End color (pink)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                border: Border.all(color: Colors.blueAccent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: const Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
