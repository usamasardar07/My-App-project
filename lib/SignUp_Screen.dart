import 'dart:io';
import 'package:aicomunitypakistan/Educational_information.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aicomunitypakistan/contact_information.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static const String id ='SignUp_Screen';
  final TextEditingController _cityController = TextEditingController();
  File? _image; // Variable to hold the selected image

  // List of cities with corresponding icons
  final List<Map<String, String>> cities = [
    {'name': 'Swabi', 'icon': 'assets/usa.jpg'},
    {'name': 'Mardan', 'icon': 'assets/pakistan.jpg'},
    {'name': 'Islambad', 'icon': 'assets/england.jpg'},
  ];

  final ImagePicker _picker = ImagePicker(); // Image picker instance

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Centered Circular Image at the Top
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: _pickImage,
                child: _image == null
                    ? const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.pinkAccent,
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.white,
                  ),
                )
                    : CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(_image!),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal Information',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Name Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.cyan,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  labelText: 'Name*',
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
            const SizedBox(height: 15),
            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.cyan,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  labelText: 'Email*',
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
            const SizedBox(height: 15),
            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                obscureText: true,
                cursorColor: Colors.cyan,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  labelText: 'Password*',
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
            const SizedBox(height: 15),
            // Current City Field with Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: _cityController,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF2F2F2),
                  labelText: 'Current City*',
                  suffixIcon: DropdownButtonHideUnderline(
                    child: DropdownButton<Map<String, String>>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (city) {
                        setState(() {
                          _cityController.text = city!['name']!;
                        });
                      },
                      items: cities.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Row(
                            children: [
                              Image.asset(city['icon']!, width: 24, height: 24),
                              const SizedBox(width: 10),
                              Text(city['name']!),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: Color(0xffF2F2F2)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: Color(0xffF2F2F2)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // CNIC Number Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.cyan,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  labelText: 'CNIC Number*',
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
            const SizedBox(height: 15),
            // User Type Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.cyan,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  labelText: 'Select User Type',
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: Color(0xffF2F2F2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: Color(0xffF2F2F2)),
                  ),
                ),
                onChanged: (value) {
                  print('value');
                },
              ),
            ),
            const SizedBox(height: 14),
            // Next Button
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF6537EC), // Start color (purple)
                        Color(0xFFDA1A8B), // End color (pink)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactInformation()));
                        },
                        child: const Text('Next', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Powered by AICP (PVT.) LTD',
              style: TextStyle(color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
