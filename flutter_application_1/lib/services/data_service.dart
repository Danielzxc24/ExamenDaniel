import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/libros.dart';

class DataService {
  Future<List<Libro>> getBooks() async {
    String jsonData = await rootBundle.loadString('database/data.json');
    List<dynamic> jsonList = json.decode(jsonData)['data'];
    List<Libro> books = jsonList.map((json) => Libro.fromJson(json)).toList();
    return books;
  }
}
