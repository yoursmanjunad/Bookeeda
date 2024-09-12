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
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Create Account"), //button 1
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Already Having Account"), //button 2
            )
          ],
        ),
      ),
    );
  }
}
