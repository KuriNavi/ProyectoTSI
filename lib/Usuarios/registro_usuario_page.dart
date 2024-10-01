import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:agenda_tsi/services/users_service.dart';

class RegistroUsuarioPage extends StatefulWidget {
  const RegistroUsuarioPage({super.key});

  @override
  State<RegistroUsuarioPage> createState() => _RegistroUsuarioPageState();
}

class _RegistroUsuarioPageState extends State<RegistroUsuarioPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController contraController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFBE9FE1),
              Color(0xFFC9B6E4),
              Color(0xFFE1CCEC),
              Color(0xFFF1F1F6),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Registro De Usuario",
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontFamily: "sans-serif"),
                ),
                Formulario()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form Formulario() {
    return Form(
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
                keyboardType: TextInputType.name,
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
                    prefixIcon: Icon(MdiIcons.eye)),
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
          Container(
            width: double.infinity * 0.5,
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    if (formKey.currentState!.validate()) {
                      UsersService().RegistrarUsuario(
                        usuarioController.text.trim(),
                        emailController.text.trim(),
                        contraController.text.trim(),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            height: 70,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.deepPurple),
                                color: Color(0xFFE1CCEC),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Registro Exitoso Felicidades",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      );
                      await Future.delayed(Duration(seconds: 3));
                      Navigator.pop(context);
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error al registrar usuario: $e'),
                      ),
                    );
                  }
                  ;
                },
                child: Text(
                  "Registrarse",
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }

  BoxDecoration decoracionForm() {
    return BoxDecoration(
        color: Color(0xFFFFE1CCEC), borderRadius: BorderRadius.circular(10));
  }
}
