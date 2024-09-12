import 'package:app/OnBoarding/LogInPage.dart';
import 'package:app/OnBoarding/SignUpPage.dart';
import 'package:flutter/material.dart';

class UserStatus extends StatefulWidget {
  const UserStatus({super.key});

  @override
  State<UserStatus> createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(), // Pushes the buttons towards the bottom

            // First button takes max width
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      20), // Add horizontal padding for better appearance
              child: SizedBox(
                width: double.infinity, // Takes full width of the screen
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Signuppage()),
                    );
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.orange),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                          vertical: 15.0), // Adjust vertical padding
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Spacing between the buttons

            // Second button takes max width
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity, // Takes full width of the screen
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    "Already Having Account",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.orange),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                          vertical: 15.0), // Adjust vertical padding
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50), // Add bottom padding for separation
          ],
        ),
      ),
    );
  }
}
