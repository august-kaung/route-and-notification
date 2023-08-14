import 'package:flutter/material.dart';
import 'package:routing_and_notification/go_router_testing/sample_model/sample_model.dart';

class SplashScren extends StatelessWidget {
  const SplashScren({super.key, required this.sampleModel});

  final List<SampleModel> sampleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPLASH SCREEN'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: sampleModel.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(sampleModel[index].name.toString()),
                    Text(sampleModel[index].address.toString()),
                    Text(sampleModel[index].phNumber.toString())
                  ],
                );
              })),
    );
  }
}
