import 'package:flutter/material.dart';
class Book {
  final String name;
  final String imageUrl;
  final String type;

  // Constructor for initializing a Book object
  Book({required this.name, required this.imageUrl, required this.type});

  // Factory method to create a Book object from Firestore data
  factory Book.fromFirestore(Map<String, dynamic> data) {
    return Book(
      name: data['name'],
      imageUrl: data['imageUrl'],
      type: data['type'],
    );
  }
}
