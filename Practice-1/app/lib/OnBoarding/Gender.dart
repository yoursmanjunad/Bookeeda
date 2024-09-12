import 'package:app/OnBoarding/UserAge.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  SigningGender? _selectedGender; // Track selected gender

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select your Gender",
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0), // Padding from the appbar
              child: RadioExample(
                onSelectionChanged: (SigningGender? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                selectedGender: _selectedGender,
              ), // Radio buttons immediately below the appbar
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: _selectedGender == null
                      ? null // Disable if no gender selected
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Userage(),
                            ),
                          );
                        },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      _selectedGender == null
                          ? Colors.orangeAccent
                          : Colors.orange, // Change color when disabled
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                        vertical: 15.0, // Adjust vertical padding
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum SigningGender { male, female, notsay }

class RadioExample extends StatelessWidget {
  final Function(SigningGender?) onSelectionChanged;
  final SigningGender? selectedGender;

  const RadioExample({
    required this.onSelectionChanged,
    required this.selectedGender,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio<SigningGender>(
            value: SigningGender.male,
            groupValue: selectedGender,
            onChanged: onSelectionChanged,
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<SigningGender>(
            value: SigningGender.female,
            groupValue: selectedGender,
            onChanged: onSelectionChanged,
          ),
        ),
        ListTile(
          title: const Text('Rather Not Say'),
          leading: Radio<SigningGender>(
            value: SigningGender.notsay,
            groupValue: selectedGender,
            onChanged: onSelectionChanged,
          ),
        ),
      ],
    );
  }
}
