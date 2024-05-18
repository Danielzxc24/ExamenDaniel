import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/libros.dart';
import 'package:flutter_application_1/models/villanos.dart';

class DetalleLibroScreen extends StatelessWidget {
  final Libro book;

  DetalleLibroScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Título', book.title),
                      _buildDetailRow('Año', book.year.toString()),
                      _buildDetailRow('Editorial', book.publisher),
                      _buildDetailRow('ISBN', book.isbn),
                      _buildDetailRow('Páginas', book.pages.toString()),
                      _buildDetailRow('Notas', book.notes.join(", ")),
                    ],
                  ),
                ),
                SizedBox(width: 16), // Espacio entre columnas
                Expanded(
                  child: _buildVillainsSection(book.villains),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildVillainsSection(List<Villain> villains) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Villanos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: villains.map((villain) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                villain.name,
                style: TextStyle(
                  fontSize: 16,
                  shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(2, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
