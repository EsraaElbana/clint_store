import 'package:flutter/material.dart';

class HomeScreenEngineer extends StatelessWidget {
  const HomeScreenEngineer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("home screen Engineer")
        ],
      ),

    );
  }
}
