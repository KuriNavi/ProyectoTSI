import 'dart:collection';
import 'dart:convert';
import 'dart:core';
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

  Future<LinkedHashMap<String, dynamic>> RegistrarUsuario(
    String nombre_usuario,
    String correo,
    String password,
  ) async {
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
      }),
    );

    if (respuesta.statusCode == 201) {
      return jsonDecode(respuesta.body);
    } else {
      throw Exception(
          'Error al registrar usuario: ${respuesta.statusCode} - ${respuesta.body}');
    }
  }

  Future<List<dynamic>> usuarios() async {
    var respuesta = await http.get(Uri.parse('${this.apiUrl}/usuarios'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    return [];
  }

  Future<void> EliminarUsuarios(int id) async {
    var respuesta = await http.delete(
      Uri.parse('${this.apiUrl}/usuarios/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
    );
    if (respuesta.statusCode == 200) {
      print('Funciona');
    } else {
      throw Exception('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    }
  }

  Future<void> modificarUsuario(int id, String nombre, String correo,
      String contra, int idFondo, int idRol) async {
    var respuesta = await http.put(
      Uri.parse(this.apiUrl + '/usuarios/actualizarTodo/{$id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(
        <String, dynamic>{
          'nombre_usuario': nombre,
          'correo': correo,
          'password': contra,
          'id_fondo': idFondo,
          'id_rol': idRol,
        },
      ),
    );

    if (respuesta.statusCode == 200) {
      return print('Funciona');
    } else {
      print('Error al modificar el usuario: ${respuesta.statusCode}');
      throw Exception('Error al modificar el usuario');
    }
  }
}
