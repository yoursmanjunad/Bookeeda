import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
          "Login Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
