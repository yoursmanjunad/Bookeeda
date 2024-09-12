import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select your Gender",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
