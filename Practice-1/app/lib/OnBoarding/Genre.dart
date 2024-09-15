import 'package:flutter/material.dart';
import 'completeProfile.dart';

class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  final List<String> genres = [
    // Genres, sub-genres, languages, famous authors, etc.
    'Fiction',
    'Non-fiction',
    'Mystery',
    'Fantasy',
    'Sci-Fi',
    'Biography',
    'Romance',
    'Thriller',
    'Historical',
    'Adventure',
    'Drama',
    'Horror',
    'Satire',
    'Poetry',
    'Philosophy',
    'Short Stories',
    'Young Adult',
    'Children’s Literature',

    // Sub-genres
    'Crime Fiction',
    'Psychological Thriller',
    'Dystopian',
    'Urban Fantasy',
    'High Fantasy',
    'Magical Realism',
    'Paranormal Romance',
    'Epic Poetry',
    'Cyberpunk',
    'Steampunk',
    'Space Opera',
    'Political Fiction',
    'Historical Romance',
    'Legal Thriller',
    'Gothic Horror',
    'Post-apocalyptic',
    'Spy Fiction',
    'Memoir',

    // Fusions (cross-genre)
    'Romantic Thriller',
    'Science Fantasy',
    'Historical Fantasy',
    'Comedy-Drama',
    'Horror-Comedy',
    'Action-Adventure',
    'Techno-thriller',
    'Mystery Romance',

    // Languages
    'Telugu',
    'Bhojpuri',
    'Hindi',
    'English',
    'Tamil',
    'Malayalam',
    'Oriya',
    'Gujarati',
    'Kannada',
    'Assamese',
    'Kashmiri',
    'Bengali',
    'Punjabi',
    'Marathi',
    'Urdu',
    'French',
    'German',
    'Spanish',
    'Russian',
    'Japanese',
    'Chinese',
    'Korean',
    'Italian',
    'Portuguese',
    'Arabic',

    // Famous Novelists/Writers
    'William Shakespeare',
    'Leo Tolstoy',
    'Jane Austen',
    'Mark Twain',
    'Charles Dickens',
    'J.K. Rowling',
    'George Orwell',
    'Agatha Christie',
    'Fyodor Dostoevsky',
    'Gabriel García Márquez',
    'Haruki Murakami',
    'Toni Morrison',
    'Ernest Hemingway',
    'Virginia Woolf',
    'Isabel Allende',
    'Stephen King',
    'Kazuo Ishiguro',
    'Jhumpa Lahiri',
    'Chimamanda Ngozi Adichie',
    'Chetan Bhagat',
    'Ruskin Bond',
    'Amish Tripathi',
    'R. K. Narayan',
    'Premchand',

    // Famous Poets/Philosophers/Writers
    'Rabindranath Tagore',
    'Rumi',
    'Sylvia Plath',
    'Pablo Neruda',
    'Kahlil Gibran',
    'Friedrich Nietzsche',
    'Albert Camus',
    'Jalaluddin Mevlana Rumi',
    'Mirza Ghalib',
    'John Keats',
    'Emily Dickinson',
    // Add more genres here...
  ];

  final Set<String> _selectedGenres = {}; // Track selected genres

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select your Favorite Genre",
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
            children: [
              // Wrap the list of genres in a SingleChildScrollView
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 10, // Spacing between buttons horizontally
                    runSpacing: 10, // Spacing between buttons vertically
                    children: genres.map((genre) {
                      final bool isSelected = _selectedGenres.contains(genre);
                      return ChoiceChip(
                        label: Text(
                          genre,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.orange,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedGenres.add(genre);
                            } else {
                              _selectedGenres.remove(genre);
                            }
                          });
                        },
                        backgroundColor: Colors.white,
                        selectedColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.orange,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Add some space before the button
              if (_selectedGenres.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            builder: (context) => UserInfoPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
