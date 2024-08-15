import 'dart:async';
import 'package:aicomunitypakistan/Login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple, // Start color (purple)
              Colors.purple, // End color (pink)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First Image
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/White.png',
                  height: 100,
                  width: 100,
                ),
              ),
              // Second Image
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/imagex.png',
                  height: 150,
                  width: 150,
                ),
              ),
              // Third Image
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/GHR.png',
                  height: 150,
                  width: 150,
                ),
              ),
              const Spacer(),
              const Text(
                'Powered by AICP (PVT.) LTD',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
