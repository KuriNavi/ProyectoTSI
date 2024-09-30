import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ActividadesService {
  final String apiUrl = 'http://10.0.2.2:8000/api';
  Future<LinkedHashMap<String, dynamic>> AgregarActividad(
      int id_usuario,
      String nombre_actividad,
      String descripcion,
      int id_categoria,
      DateTime fecha_hora_inicio,
      DateTime fecha_hora_termino,
      DateTime recordatorio) async {
    var respuesta = await http.post(
      Uri.parse(this.apiUrl + '/actividades'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(
        <String, dynamic>{
          'id_usuario': id_usuario,
          'nombre_actividad': nombre_actividad,
          'descripcion': descripcion,
          'id_categoria': id_categoria,
          'fecha_hora_inicio': fecha_hora_inicio,
          'fecha_hora_termino': fecha_hora_termino,
          'recordatorio': recordatorio
        },
      ),
    );
    return json.decode(respuesta.body);
  }

  Future<List<dynamic>> ActividadesPorFecha() async {
    var respuesta = await http.get(Uri.parse('${this.apiUrl}/actividades/'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    return [];
  }
}
