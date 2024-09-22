import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  final String bookName;
  final String bookImageUrl;
  final String bookType; // 'paperback', 'audio', 'ebook'

  const ThankYouPage({
    super.key,
    required this.bookName,
    required this.bookImageUrl,
    required this.bookType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background celebration effect (can be changed to other effects)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.yellow],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thank You!',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "You've successfully purchased the book: $bookName",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Book Image on the right corner
          Positioned(
            top: 50,
            right: 16,
            child: Image.network(
              bookImageUrl,
              width: 120,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          // Review option and further action button in the middle
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Review button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to review page or trigger review action
                  },
                  child: Text('Give a Review'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                SizedBox(height: 30),
                // Dynamic button based on book type (Paperback, Audio, eBook)
                ElevatedButton(
                  onPressed: () {
                    // Navigate to tracking, listening, or reading based on book type
                  },
                  child: Text(_getButtonText(bookType)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to determine button text based on book type
  String _getButtonText(String bookType) {
    switch (bookType.toLowerCase()) {
      case 'paperback':
        return 'Track Order';
      case 'audio':
        return 'Listen Now';
      case 'ebook':
        return 'Read Now';
      default:
        return 'Continue';
    }
  }
}
