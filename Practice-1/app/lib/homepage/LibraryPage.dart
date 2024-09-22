import 'package:flutter/material.dart';

import 'DeliveryStatusPage.dart';
import 'ListeningBookPage.dart';
import 'ReadingBookPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LibraryPage(),
  ));
}

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final List<Book> books = [
    Book(title: "E-Book Title", format: "Ebook", completion: 70, image: 'images/Product 0.jpg'),
    Book(title: "Audio Book Title", format: "Audiobook", completion: 45, image: 'images/Product 6.jpg'),
    Book(title: "Paperback Book", format: "Paperback", completion: 100, image: 'images/Product 8.jpg'),
  ];

  int? selectedIndex; // To track the selected card

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Library', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Update the selected card
              });
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? Colors.orange : Colors.grey, // Change border color based on selection
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0, // No elevation for the card
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        book.image,
                        height: screenHeight * 0.2, // 20% of the screen height
                        width: screenWidth * 0.3,  // 30% of the screen width
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 10),
                          Text('Format: ${book.format}'),
                          SizedBox(height: 10),
                          // Progress bar to represent book completion
                          LinearProgressIndicator(
                            value: book.completion / 100, // Normalized value for progress
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                            minHeight: 8, // Adjust the height of the progress bar
                          ),
                          SizedBox(height: 10),
                          Text('${book.completion}% Completed', style: TextStyle(color: Colors.orange)),
                          SizedBox(height: 10),
                          // Button based on book format
                          ElevatedButton(
                            onPressed: () {
                              if (book.format == "Ebook") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ReadBookPage(bookTitle: book.title)),
                                );
                              } else if (book.format == "Audiobook") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListeningPage(bookTitle: book.title, bookPoster: book.image)),
                                );
                              } else if (book.format == "Paperback") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DeliveryStatusPage(bookTitle: book.title)),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange, // Button color
                            ),
                            child: Text(
                              book.format == "Ebook"
                                  ? "Read Now"
                                  : book.format == "Audiobook"
                                  ? "Listen Now"
                                  : "Track Now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Book {
  final String title;
  final String format;
  final int completion;
  final String image;

  Book({required this.title, required this.format, required this.completion, required this.image});
}
