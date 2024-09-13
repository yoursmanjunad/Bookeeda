import 'package:flutter/material.dart';
import 'UserAge.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioExample(
                onSelectionChanged: (SigningGender? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                selectedGender: _selectedGender,
              ),
              const Spacer(),
              if (_selectedGender != null) // Show "Continue" only if selected
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
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
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
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
