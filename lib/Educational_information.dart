import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Import for date formatting

class EducationalInformation extends StatefulWidget {
  const EducationalInformation({super.key});

  @override
  State<EducationalInformation> createState() => _EducationalInformationState();
}

class _EducationalInformationState extends State<EducationalInformation> {
  static const String id = 'Educational_information';

  // Controllers for start and end year fields
  final TextEditingController startYearController = TextEditingController();
  final TextEditingController endYearController = TextEditingController();

  // Function to show date picker
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),  // Adjust as needed
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.year,  // Start with year selection
    );

    if (picked != null) {
      setState(() {
        // Format the date to include day, month, and year
        controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(  // Added to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.white,
                  child: const Image(
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                    image: AssetImage('assets/logo2.png'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Educational Information',
                style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Degree Title Field
              _buildTextField('Degree Title*'),
              const SizedBox(height: 10),

              // Degree Starting Year Field
              _buildDateField('Degree Starting Year*', startYearController),
              const SizedBox(height: 10),

              // Degree Ending Year Field
              _buildDateField('Degree Ending Year*', endYearController),
              const SizedBox(height: 10),

              // University/College Field
              _buildTextField('University / College'),
              const SizedBox(height: 10),

              // Country Field
              _buildTextField('Country*'),
              const SizedBox(height: 10),

              // City Field
              _buildTextField('City*'),
              const SizedBox(height: 20),

              // Sign Up Button with Pop-Up Message
              Center(
                child: InkWell(
                  onTap: () {
                    // Display a pop-up message when Sign Up is clicked
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign up successful!'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.purpleAccent,
                      ),
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 460,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6537EC), // Start color (purple)
                          Color(0xFFDA1A8B), // End color (pink)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Center(
                      child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Powered by AICP (PVT.)LTD',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build TextFormField
  Widget _buildTextField(String labelText) {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: Colors.cyan,
      enabled: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF2F2F2),
        labelText: labelText,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffF2F2F2)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffF2F2F2)),
        ),
      ),
    );
  }

  // Helper function to build date picker field
  Widget _buildDateField(String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      readOnly: true,  // Prevent manual editing
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF2F2F2),
        labelText: labelText,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffF2F2F2)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffF2F2F2)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today, color: Colors.indigo),
          onPressed: () => _selectDate(context, controller),  // Show date picker on icon press
        ),
      ),
    );
  }
}
