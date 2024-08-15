import 'dart:io';
import 'package:aicomunitypakistan/contact_information.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aicomunitypakistan/Educational_information.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  String? selectedUserType;
  File? _image;

  // List of cities
  final List<String> cities = [
    'Swabi',
    'Mardan',
    'Islamabad',
    'Peshawar',
    'Karachi',
  ];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _validateAndProceed() {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        _showDialog("Error", "Please upload an image");
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ContactInformation()),
      );
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.endsWith('@gmail.com')) {
                      return 'Please enter a valid Gmail address';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              // Current City Field with Dropdown and Manual Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: _cityController,
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF2F2F2),
                    labelText: 'Current City*',
                    suffixIcon: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (city) {
                          setState(() {
                            _cityController.text = city!;
                          });
                        },
                        items: cities.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter or select your current city';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              // CNIC Number Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: _cnicController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your CNIC number';
                    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'CNIC must be a number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              // User Type Field
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a user type';
                    }
                    return null;
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
                          Color(0xFF6537EC),
                          Color(0xFFDA1A8B),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: _validateAndProceed,
                        child: const Text('Next',
                            style: TextStyle(color: Colors.white)),
                      ),
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
      ),
    );
  }
}
