import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubDetailsScreen extends StatelessWidget {
  const SubDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.goNamed('sub_details_two');
        },
      ),
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('SubDetailsScreen'),

      ),

    );
  }
}
