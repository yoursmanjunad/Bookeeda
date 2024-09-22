import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Dummy user data for demonstration
  final String profilePhoto = 'images/default_author.jpg'; // Default profile photo
  final String firstName = 'Manjunath';
  final String lastName = 'Irukulla';
  final String mobileNumber = '+91 7093829755';
  final String email = 'imanjunad@gmail.com';
  final List<String> addresses = ['123 Main St', '456 Oak Ave'];
  final List<String> savedCards = ['1234 1234 1234 1234', '1234 1234 1234 5678'];
  final String userRole = 'Reader'; // User role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Photo
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profilePhoto),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      userRole,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // User Information
              Text(
                '$firstName $lastName',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                mobileNumber,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                email,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Addresses Section
              _buildSectionTitle('Saved Addresses:'),
              _buildInfoCard(addresses),

              SizedBox(height: 20),

              // Saved Cards Section
              _buildSectionTitle('Saved Cards:'),
              _buildInfoCard(savedCards),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper method to build information cards
  Widget _buildInfoCard(List<String> items) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                item,
                style: TextStyle(fontSize: 16),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
