import 'package:flutter/material.dart';

class ReadBookPage extends StatefulWidget {
  final String bookTitle;

  ReadBookPage({required this.bookTitle});

  @override
  _ReadBookPageState createState() => _ReadBookPageState();
}

class _ReadBookPageState extends State<ReadBookPage> {
  int currentPage = 1;
  int totalPages = 100; // Example: Total number of pages
  List<String> bookContent = List.generate(
    100,
        (index) => "This is the content of page ${index + 1}. You can highlight this text.",
  ); // Sample content for 100 pages

  // Highlight colors
  Color selectedHighlightColor = Colors.transparent;
  Map<int, Color> highlightedPages = {}; // To track highlighted pages

  void _highlightText(int page) {
    setState(() {
      highlightedPages[page] = selectedHighlightColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentPage / totalPages; // Calculate progress

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookTitle),
        backgroundColor: Colors.orange,
        actions: [
          PopupMenuButton<Color>(
            onSelected: (Color color) {
              setState(() {
                selectedHighlightColor = color;
              });
            },
            icon: Icon(Icons.color_lens),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Color>>[
              PopupMenuItem<Color>(
                value: Colors.orange,
                child: Text('Highlight in Orange', style: TextStyle(color: Colors.orange)),
              ),
              PopupMenuItem<Color>(
                value: Colors.yellow,
                child: Text('Highlight in Yellow', style: TextStyle(color: Colors.yellow)),
              ),
              PopupMenuItem<Color>(
                value: Colors.blue,
                child: Text('Highlight in Blue', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onLongPress: () {
                // Highlight the current page on long press
                _highlightText(currentPage);
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: highlightedPages[currentPage] ?? Colors.transparent, // Highlight color for the current page
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    bookContent[currentPage - 1],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          // Page Navigation and Progress
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Page Button
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: currentPage > 1
                      ? () {
                    setState(() {
                      currentPage--;
                    });
                  }
                      : null,
                ),
                // Progress Bar
                Expanded(
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      ),
                      SizedBox(height: 5),
                      Text('${(progress * 100).toStringAsFixed(0)}% Completed'),
                    ],
                  ),
                ),
                // Next Page Button
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: currentPage < totalPages
                      ? () {
                    setState(() {
                      currentPage++;
                    });
                  }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
