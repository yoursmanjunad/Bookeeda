import 'package:flutter/material.dart';
class DeliveryStatusPage extends StatelessWidget {
  final String bookTitle;

  DeliveryStatusPage({required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$bookTitle Delivery Status'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tracking Information for "$bookTitle"',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Current Status: In Transit', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Expected Delivery Date: 3 Days', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Last Location: Distribution Center', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Tracking Number: ABC123456', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
