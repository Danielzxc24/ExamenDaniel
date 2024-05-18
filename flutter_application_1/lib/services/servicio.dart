import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/libros.dart';
import 'package:flutter_application_1/services/data_service.dart';

class ListaScreen extends StatefulWidget {
  const ListaScreen({Key? key}) : super(key: key);

  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  late List<Libro> libros = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    try {
      final bookList = await DataService().getBooks();
      setState(() {
        libros = bookList;
        loading = false;
      });
    } catch (e) {
      // Manejar errores aquí
      print('Error al cargar los libros: $e');
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Libros'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : libros.isEmpty
              ? Center(child: Text('No se encontraron libros'))
              : _buildBookList(),
    );
  }

  Widget _buildBookList() {
    return ListView.separated(
      itemCount: libros.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(libros[index].title),
        );
      },
    );
  }
}
