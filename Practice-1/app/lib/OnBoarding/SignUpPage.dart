import 'package:flutter/material.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an Account"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Custom action for the back button
            Navigator.pop(context); // Goes back to the previous page
          },
        ),
      ),
      body: const Center(
        child: Text(
          "SignUp Here",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
