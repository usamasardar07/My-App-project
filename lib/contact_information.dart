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

  // Database helper instance
  final DatabaseHelper dbHelper = DatabaseHelper();

  // Function to save contact information to the database
  void saveContactInformation() async {
    String whatsapp = whatsappController.text;
    String linkedin = linkedinController.text;
    String github = githubController.text;
    String instagram = instagramController.text;
    String profileSummary = profileSummaryController.text;

    if (whatsapp.isEmpty || linkedin.isEmpty || profileSummary.isEmpty) {
      _showDialog("Error", "Please fill in all required fields");
      return;
    }

    // Save the data to the database
    await dbHelper.insertContactInfo({
      'whatsapp': whatsapp,
      'linkedin': linkedin,
      'github': github,
      'instagram': instagram,
      'profile_summary': profileSummary,
    });

    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EducationalInformation()),
    );
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
      body: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
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
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  labelText: 'Profile Summary*',
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
    );
  }
}
