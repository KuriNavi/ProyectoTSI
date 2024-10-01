import 'package:flutter/material.dart';
import 'package:agenda_tsi/services/users_service.dart';

class BorrarUsuariosPanicoPage extends StatefulWidget {
  const BorrarUsuariosPanicoPage({super.key});

  @override
  State<BorrarUsuariosPanicoPage> createState() =>
      _BorrarUsuariosPanicoPageState();
}

class _BorrarUsuariosPanicoPageState extends State<BorrarUsuariosPanicoPage> {
  int usuarioSeleccionado = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            FutureBuilder(
              future: UsersService().usuarios(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Cargando Usuarios...');
                }
                var usuarios = snapshot.data;
                if (usuarios.isEmpty) {
                  return Text('No hay usuarios disponibles');
                }
                return DropdownButtonFormField<int>(
                  items: usuarios.map<DropdownMenuItem<int>>((usuario) {
                    return DropdownMenuItem<int>(
                        child: Text(usuario['nombre_usuario']),
                        value: usuario['id']);
                  }).toList(),
                  onChanged: (value) {
                    usuarioSeleccionado = value!;
                  },
                  value: usuarioSeleccionado ?? usuarios[1]['id'],
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  UsersService().EliminarUsuarios(usuarioSeleccionado);
                  Navigator.pop(context);
                },
                child: Text('Eliminar Usuario'))
          ],
        ),
      ),
    );
  }
}
