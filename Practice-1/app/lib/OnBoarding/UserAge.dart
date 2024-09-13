import 'package:app/OnBoarding/Genre.dart';
import 'package:flutter/material.dart';

class Userage extends StatefulWidget {
  const Userage({super.key});

  @override
  State<Userage> createState() => _UserageState();
}

class _UserageState extends State<Userage> {
  int _selectedIndex = -1; // to keep track of selected button

  final List<String> ageGroups = [
    "0-10",
    "11-20",
    "21-30",
    "31-40",
    "41-50",
    "51+"
  ];

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    childAspectRatio: 3, // Aspect ratio of the buttons
                    crossAxisSpacing: 15, // Horizontal spacing
                    mainAxisSpacing: 15, // Vertical spacing
                  ),
                  itemCount: ageGroups.length,
                  itemBuilder: (context, index) {
                    bool isSelected = _selectedIndex == index;

                    return TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index; // Update the selected index
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          isSelected ? Colors.orange : Colors.white,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        ageGroups[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_selectedIndex !=
                  -1) // Show the "Continue" button only when an option is selected
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
                            builder: (context) => const Genre(),
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
