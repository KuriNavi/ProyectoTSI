import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:agenda_tsi/services/users_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController ControladorEmail = TextEditingController();
  final TextEditingController ControladorContra = TextEditingController();
  GlobalKey<FormState> KeyFormulario = GlobalKey<FormState>();
  bool ocultarContra = true;

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
                  "Agenda Guay Super Cuqui",
                  style: TextStyle(fontSize: 40, fontFamily: "sans-serif"),
                ),
                SizedBox(
                  height: 70,
                ),
                formulario(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form formulario() {
    return Form(
      key: KeyFormulario,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: decoracionForm(),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: ControladorEmail,
                decoration: InputDecoration(
                  labelText: "Correo",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email_rounded),
                ),
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
                keyboardType: TextInputType.text,
                obscureText: ocultarContra,
                controller: ControladorContra,
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ocultarContra = !ocultarContra;
                      });
                    },
                    icon: Icon(ocultarContra ? MdiIcons.eyeOff : MdiIcons.eye),
                  ),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresar Contraseña';
                  }
                  if (value.length < 5) {
                    return 'La Contrase;a no tiene el largo requerido';
                  }
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(color: Colors.deepPurple),
              ),
              onPressed: () async {
                if (KeyFormulario.currentState!.validate()) {
                  bool pasoElLogin = await UsersService().IniciarSesion(
                    ControladorEmail.text.trim(),
                    ControladorContra.text.trim(),
                  );

                  if (pasoElLogin) {
                    Navigator.pushReplacementNamed(
                        context, '/Actividades/actividades_lista');
                  }
                }
              },
            ),
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
