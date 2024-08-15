import 'package:flutter/material.dart';
class ProfessorScreen extends StatefulWidget {
  const ProfessorScreen({super.key});

  @override
  State<ProfessorScreen> createState() => _ProfessorScreenState();
}

class _ProfessorScreenState extends State<ProfessorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Center(child:  Text('This is Professor Screen')),),
    );
  }
}
