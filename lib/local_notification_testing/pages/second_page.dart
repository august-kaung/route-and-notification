import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key,required this.payload});
  final String payload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          payload
        ),
      ),
    );
  }
}
