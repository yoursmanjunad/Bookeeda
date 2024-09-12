import 'package:flutter/material.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  final borderApp = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.white12,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: const Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter the amount in USD',
                      hintStyle: const TextStyle(
                        color: Colors.green,
                      ),
                      prefixIcon: const Icon(Icons.monetization_on),
                      prefixIconColor: Colors.green,
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: borderApp,
                      enabledBorder: borderApp,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print("Thanks!");
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: const Text(
                  "Click Me",
                  style: TextStyle(
                    color: Colors.green,
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
