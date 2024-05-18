import 'package:flutter_application_1/models/villanos.dart'; 

class Libro {
  final int id;
  final int year;
  final String title;
  final String handle;
  final String publisher;
  final String isbn;
  final int pages;
  final List<String> notes;
  final DateTime createdAt;
  final List<Villain> villains;

  Libro({
    required this.id,
    required this.year,
    required this.title,
    required this.handle,
    required this.publisher,
    required this.isbn,
    required this.pages,
    required this.notes,
    required this.createdAt,
    required this.villains,
  });

  factory Libro.fromJson(Map<String, dynamic> json) {
    return Libro(
      id: json['id'],
      year: json['Year'],
      title: json['Title'],
      handle: json['handle'],
      publisher: json['Publisher'],
      isbn: json['ISBN'],
      pages: json['Pages'],
      notes: List<String>.from(json['Notes'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
      villains: (json['villains'] as List<dynamic> ?? [])
          .map((villainJson) => Villain.fromJson(villainJson))
          .toList(),
    );
  }
}
