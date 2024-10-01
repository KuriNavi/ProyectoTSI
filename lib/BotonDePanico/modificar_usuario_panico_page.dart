import 'package:agenda_tsi/services/fondos_services.dart';
import 'package:agenda_tsi/services/roles_service.dart';
import 'package:flutter/material.dart';
import 'package:agenda_tsi/services/users_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ModificarUsuarioPanicoPage extends StatefulWidget {
  const ModificarUsuarioPanicoPage({super.key});

  @override
  State<ModificarUsuarioPanicoPage> createState() =>
      _ModificarUsuarioPanicoPageState();
}

class _ModificarUsuarioPanicoPageState
    extends State<ModificarUsuarioPanicoPage> {
  int? usuarioSeleccionado = 1;
  int? idFondo = 1;
  int? idRol = 1;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController contraController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: decoracionForm(),
                      child: TextFormField(
                        controller: usuarioController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: "Nombre De Usuario",
                            border: InputBorder.none,
                            prefixIcon: Icon(MdiIcons.account)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por Favor Ingresar Un Nombre De Usuario';
                          }
                          if (value.length >= 50) {
                            return 'El Nombre De Usuario Tiene un Limite de 50 caracteres';
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: decoracionForm(),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Correo Electronico",
                            border: InputBorder.none,
                            prefixIcon: Icon(MdiIcons.email)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'por favor Ingresar un Correo electronico';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'ingresar una dirrecion de correo valida';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: decoracionForm(),
                      child: TextFormField(
                        controller: contraController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: InputBorder.none,
                            prefixIcon: Icon(MdiIcons.lock)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresar Una Contraseña';
                          }
                          if (value.length < 5) {
                            return 'la Contraseña Debe ser de mas de 5 caracteres';
                          }
                        },
                      ),
                    ),
                  ),
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
                  FutureBuilder(
                    future: FondosServices().fondos(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Cargando Fondos...');
                      }
                      var fondos = snapshot.data;
                      if (fondos.isEmpty) {
                        return Text('No hay usuarios disponibles');
                      }
                      return DropdownButtonFormField<int>(
                        items: fondos.map<DropdownMenuItem<int>>((fondo) {
                          return DropdownMenuItem<int>(
                              child: Text(fondo['imagen']), value: fondo['id']);
                        }).toList(),
                        onChanged: (value) {
                          idFondo = value!;
                        },
                        value: idFondo ?? fondos[1]['id'],
                      );
                    },
                  ),
                  FutureBuilder(
                    future: RolesService().roles(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Cargando Roles...');
                      }
                      var roles = snapshot.data;
                      if (roles.isEmpty) {
                        return Text('No hay usuarios disponibles');
                      }
                      return DropdownButtonFormField<int>(
                        items: roles.map<DropdownMenuItem<int>>((rol) {
                          return DropdownMenuItem<int>(
                              child: Text(rol['nombre_rol']), value: rol['id']);
                        }).toList(),
                        onChanged: (value) {
                          idRol = value!;
                        },
                        value: idRol ?? roles[1]['id'],
                      );
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    UsersService().modificarUsuario(
                        usuarioSeleccionado!,
                        usuarioController.text.trim(),
                        emailController.text.trim(),
                        contraController.text.trim(),
                        idFondo!,
                        idRol!);
                    Navigator.pop(context);
                  }
                  ;
                },
                child: Text('Modificar el Usuario'))
          ],
        ),
      ),
    );
  }

  BoxDecoration decoracionForm() {
    return BoxDecoration(
        color: Color(0xFFFFE1CCEC), borderRadius: BorderRadius.circular(10));
  }
}
