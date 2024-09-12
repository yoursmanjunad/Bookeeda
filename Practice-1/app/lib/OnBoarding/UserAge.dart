import 'package:app/OnBoarding/Genre.dart';

import 'Gender.dart';
import 'package:flutter/material.dart';

class Userage extends StatefulWidget {
  const Userage({super.key});

  @override
  State<Userage> createState() => _UserageState();
}

class _UserageState extends State<Userage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select your Age Group",
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), //
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Genre(),
                        ),
                      );
                    },
                    child: Text(
                      "Continue",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
