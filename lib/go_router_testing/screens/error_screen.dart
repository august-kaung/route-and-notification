import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title:const Text('Error SCREEN'),
        centerTitle: true,
      ),
    );
  }
}
