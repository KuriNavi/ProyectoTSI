import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersService {
  final String apiUrl = 'http://10.0.2.2:8000/api';

  Future<bool> IniciarSesion(String correo, String contra) async {
    var respuesta = await http.post(
      Uri.parse(this.apiUrl + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: json.encode(
        <String, dynamic>{
          'correo': correo,
          'password': contra,
        },
      ),
    );
    if (respuesta.statusCode == 200) {
      final datos = jsonDecode(respuesta.body);
      print('Inicio De Sesion exitoso: $datos');
      return true;
    } else if (respuesta.statusCode == 401) {
      print(
          'Este Usuario No Existe o no fue capaz de encontrarse en la base de datos');
      return false;
    } else {
      print('Error en la solicitud: ${respuesta.statusCode}');
      print('Respuesta del servidor: ${respuesta.body}');
      return false;
    }
  }

  Future<LinkedHashMap<String, dynamic>> AgregarUsuario(
      String nombre_usuario,
      String correo,
      String password,
      int plus,
      int id_fondo,
      int id_rol) async {
    var respuesta = await http.post(
      Uri.parse(this.apiUrl + '/usuarios'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(<String, dynamic>{
        'nombre_usuario': nombre_usuario,
        'correo': correo,
        'password': password,
        'plus': plus,
        'id_fondo': id_fondo,
        'id_rol': id_rol,
      }),
    );

    return jsonDecode(respuesta.body);
  }
}
