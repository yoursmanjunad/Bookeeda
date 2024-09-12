import 'UserAge.dart';
import 'package:flutter/material.dart';

class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select your Fav Genre",
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
