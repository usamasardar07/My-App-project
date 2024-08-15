import 'package:aicomunitypakistan/Splash_screentwo.dart';
import 'package:flutter/material.dart';
import 'package:aicomunitypakistan/Forgot_Password.dart';
import 'package:aicomunitypakistan/SignUp_Screen.dart';
import 'package:aicomunitypakistan/data_base_helper.dart';
import 'package:aicomunitypakistan/User/Professional_Screen.dart';
import 'package:aicomunitypakistan/User/Student_screen.dart';
import 'package:aicomunitypakistan/User/University_screen.dart';
import 'package:aicomunitypakistan/User/company_screen.dart';
import 'package:aicomunitypakistan/User/professor_screen.dart';
import 'package:aicomunitypakistan/splash_screen1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final DatabaseHelper db = DatabaseHelper();
  String? selectedUserType;

  void navigateToUserScreen(String userType) {
    switch (userType) {
      case 'Student':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const StudentScreen()));
        break;
      case 'Professional':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfessionalScreen()));
        break;
      case 'Professor':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfessorScreen()));
        break;
      case 'Company':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const CompanyScreen()));
        break;
      case 'University':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UniversityScreen()));
        break;
      default:
        _showDialog("Error", "User type not recognized");
    }
  }

  void _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty || selectedUserType == null) {
      _showDialog("Error", "Please fill in all fields");
      return;
    }

    var user = await db.getUser(email, password);

    if (user != null && user['userType'] == selectedUserType) {
      _showDialog("Success", "Login successful!");
      navigateToUserScreen(selectedUserType!);
    } else {
      _showDialog("Error", "Invalid email, password, or user type");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            fit: BoxFit.cover,
            height: 130,
            width: 130,
            image: AssetImage('assets/logo2.png'),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.cyan,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xffF2F2F2),
                hintText: 'Email',
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xffF2F2F2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xffF2F2F2)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.cyan,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xffF2F2F2),
                hintText: 'Password',
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xffF2F2F2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xffF2F2F2)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButtonFormField<String>(
              value: selectedUserType,
              items: ['Student', 'Professional', 'Professor', 'Company', 'University']
                  .map((String userType) {
                return DropdownMenuItem<String>(
                  value: userType,
                  child: Text(userType),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedUserType = newValue!;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xffF2F2F2),
                labelText: 'Select User Type',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xffF2F2F2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xffF2F2F2)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6537EC), // Start color (purple)
                    Color(0xFFDA1A8B), // End color (pink)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Center(
                child: InkWell(
                  onTap: _login,
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 17),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ForgotPassword()));
                },
                child: const Text('Forgot Your Password'),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashScreentwo(),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    });
                  },
                  child: const Text(
                    'SIGN UP HERE',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 5,
            width: 80,
            decoration: const BoxDecoration(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
