import 'package:flutter/material.dart';

class SplashScreentwo extends StatefulWidget {
  const SplashScreentwo({super.key});

  @override
  State<SplashScreentwo> createState() => _SplashScreentwoState();
}

class _SplashScreentwoState extends State<SplashScreentwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2), // Set the background color of the Scaffold
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Select ',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Your ',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Community',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 6),
              _buildCommunityOption(
                context,
                icon: Icons.school,
                title: 'Student',
                subtitle: 'Graduates',
              ),
              SizedBox(height: 8.0),
              _buildCommunityOption(
                context,
                icon: Icons.person,
                title: 'Professor',
                subtitle: '',
              ),
              SizedBox(height: 8.0),
              _buildCommunityOption(
                context,
                icon: Icons.work,
                title: 'Industry Professional',
                subtitle: '',
              ),
              SizedBox(height: 8.0),
              _buildCommunityOption(
                context,
                icon: Icons.business,
                title: 'Company',
                subtitle: 'Small, Medium, & Large',
              ),
              SizedBox(height: 8.0),
              _buildCommunityOption(
                context,
                icon: Icons.school_outlined,
                title: 'Educational Institute',
                subtitle: 'Colleges & Universities',
                isWhiteBackground: true, // Flag to differentiate the background
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityOption(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    bool isWhiteBackground = false,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle the tap
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: isWhiteBackground
              ? null
              : LinearGradient(
            colors: [Colors.grey.shade300, Colors.blue.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: isWhiteBackground ? Colors.white : null,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.purple,
            ),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
