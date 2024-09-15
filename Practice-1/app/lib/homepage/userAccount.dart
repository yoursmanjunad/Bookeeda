import 'package:flutter/material.dart';

class Useraccount extends StatefulWidget {
  const Useraccount({super.key});

  @override
  State<Useraccount> createState() => _UseraccountState();
}

class _UseraccountState extends State<Useraccount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Account Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
