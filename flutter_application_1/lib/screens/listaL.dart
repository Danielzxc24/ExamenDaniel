import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/libros.dart';
import 'package:flutter_application_1/services/data_service.dart';
import 'package:flutter_application_1/screens/detalleL.dart'; 

class ListaLibroScreen extends StatefulWidget {
  @override
  _ListaLibroScreenState createState() => _ListaLibroScreenState();
}

class _ListaLibroScreenState extends State<ListaLibroScreen> {
  late List<Libro> books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks(); 
  }

  Future<void> _loadBooks() async {
    final bookList = await DataService().getBooks();
    setState(() {
      books = bookList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: _buildBookList(),
    );
  }

  Widget _buildBookList() {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          leading: Icon(Icons.book),
          title: Text(book.title),
          subtitle: Text('Editorial: ${book.publisher}'), 
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalleLibroScreen(book: book),
              ),
            );
          },
        );
      },
    );
  }
}
