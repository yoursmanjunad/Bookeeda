import 'Genre.dart';
import 'package:flutter/material.dart';

class Completeprofile extends StatefulWidget {
  const Completeprofile({super.key});

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Complete your Profile",
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const (),
                      //   ),
                      // );
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
