import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class FondosServices {
  final String apiUrl = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> fondos() async {
    var respuesta = await http.get(Uri.parse('${this.apiUrl}/fondos'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    return [];
  }
}
