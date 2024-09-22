import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  // Dummy user data for demonstration
  final List<Book> books = [
    Book(
      title: 'The Great Gatsby',
      image: 'images/P.jpg',
      format: 'eBook',
      remainingPercentage: 75,
      audioUrl: 'audio/great_gatsby.mp3',
      ebookUrl: 'ebooks/great_gatsby.pdf',
    ),
    Book(
      title: '1984',
      image: 'images/1984.jpg',
      format: 'Audio',
      remainingPercentage: 50,
      audioUrl: 'audio/1984.mp3',
      ebookUrl: 'ebooks/1984.pdf',
    ),
    // Add more books as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Library"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return _buildBookCard(context, books[index]);
          },
        ),
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, Book book) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Book Image
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(4),
                color: Colors.orange,
                child: Text(
                  book.format,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          // Book Title and Remaining Percentage
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Remaining: ${book.remainingPercentage}%',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Spacer(),
                // Read Now Button
                ElevatedButton(
                  onPressed: () {
                    _redirectToContent(context, book);
                  },
                  child: Text('Read Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _redirectToContent(BuildContext context, Book book) {
    // Navigate to the appropriate content based on format
    if (book.format == 'Audio') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AudioBookPage(book.audioUrl),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EBookPage(book.ebookUrl),
        ),
      );
    }
  }
}

// Book model
class Book {
  final String title;
  final String image;
  final String format;
  final int remainingPercentage;
  final String audioUrl;
  final String ebookUrl;

  Book({
    required this.title,
    required this.image,
    required this.format,
    required this.remainingPercentage,
    required this.audioUrl,
    required this.ebookUrl,
  });
}

// Placeholder for AudioBook Page
class AudioBookPage extends StatelessWidget {
  final String audioUrl;

  AudioBookPage(this.audioUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Book"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text("Playing Audio from $audioUrl"), // Placeholder content
      ),
    );
  }
}

// Placeholder for EBook Page
class EBookPage extends StatelessWidget {
  final String ebookUrl;

  EBookPage(this.ebookUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eBook"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text("Displaying eBook from $ebookUrl"), // Placeholder content
      ),
    );
  }
}
