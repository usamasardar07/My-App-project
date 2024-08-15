import 'package:flutter/material.dart';
import 'package:aicomunitypakistan/Educational_information.dart';
import 'package:aicomunitypakistan/database_helper_contact.dart';

class ContactInformation extends StatefulWidget {
  const ContactInformation({super.key});

  @override
  State<ContactInformation> createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  static const String id = 'contact_information';

  // Controllers for form fields
  final whatsappController = TextEditingController();
  final linkedinController = TextEditingController();
  final githubController = TextEditingController();
  final instagramController = TextEditingController();
  final profileSummaryController = TextEditingController();

  // GlobalKey to handle form validation
  final _formKey = GlobalKey<FormState>();

  // Database helper instance
  final DatabaseHelper dbHelper = DatabaseHelper();

  // Function to save contact information to the database
  void saveContactInformation() async {
    if (_formKey.currentState!.validate()) {
      // Save the data to the database
      await dbHelper.insertContactInfo({
        'whatsapp': whatsappController.text,
        'linkedin': linkedinController.text,
        'github': githubController.text,
        'instagram': instagramController.text,
        'profile_summary': profileSummaryController.text,
      });

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EducationalInformation()),
      );
    } else {
      _showDialog("Error", "Please fill in all required fields.");
    }
  }

  // Function to show dialog
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                  child: const Image(
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                    image: AssetImage('assets/logo2.png'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Contact Information',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: whatsappController,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.cyan,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F2F2),
                    labelText: 'WhatsApp Number*',
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
                      return 'Please enter your WhatsApp number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: linkedinController,
                  keyboardType: TextInputType.url,
                  cursorColor: Colors.cyan,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F2F2),
                    labelText: 'LinkedIn Profile Link*',
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
                      return 'Please enter your LinkedIn profile link';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: githubController,
                  keyboardType: TextInputType.url,
                  cursorColor: Colors.cyan,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F2F2),
                    labelText: 'GitHub Profile Link',
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
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: instagramController,
                  keyboardType: TextInputType.url,
                  cursorColor: Colors.cyan,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F2F2),
                    labelText: 'Instagram Profile Link',
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
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: profileSummaryController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF2F2F2),
                    hintText:  'Profile Summary*',
                    suffixText: '${profileSummaryController.text.length}/200',
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      borderSide: BorderSide(color: Color(0xffF2F2F2)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      borderSide: BorderSide(color: Color(0xffF2F2F2)),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {}); // Trigger a rebuild to update the suffix text
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your profile summary';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 27),
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
                        onTap: saveContactInformation,
                        child: const Text('Next', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Powered by AICP (PVT.)LTD',
                style: TextStyle(color: Colors.indigo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
