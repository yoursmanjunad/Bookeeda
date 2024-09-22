import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<String> bookImages = [
    'images/Product1.jpg', // Add your book images here
    'images/Product2.jpg',
    'images/Product3.jpg',
    'images/Product4.jpg',
    'images/Product5.jpg',
    'images/Product6.jpg',
  ];

  CategoryPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Books'),
        backgroundColor: Colors.orange, // Keeping the color scheme in mind
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: bookImages.length, // Number of books to display
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 books per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7, // Adjust for image height
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the book's detail page when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookPage(index),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners for images
                      child: Image.asset(
                        bookImages[index], // Book image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Book ${index + 1}', // Replace with the actual book name if available
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Placeholder for the Book Details Page
class BookPage extends StatelessWidget {
  final int bookIndex;

  BookPage(this.bookIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Details for Book ${bookIndex + 1}', // Display more detailed information
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
