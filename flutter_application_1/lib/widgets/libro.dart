import 'dart:convert';
import 'package:flutter/services.dart';

class JsonReader {
  static Future<Map<String, dynamic>> readData() async {
    final String data = await rootBundle.loadString('database/data.json');

    final Map<String, dynamic> jsonData = json.decode(data);

    return jsonData;
  }
}

void loadData() async {
  Map<String, dynamic> jsonData = await JsonReader.readData();
 print(jsonData);
}