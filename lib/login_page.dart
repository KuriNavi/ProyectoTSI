import 'package:agenda_tsi/Actividades/actividades_lista.dart';
import 'package:agenda_tsi/BotonDePanico/boton_panico_page.dart';
import 'package:agenda_tsi/Usuarios/registro_usuario_page.dart';
import 'package:agenda_tsi/pages/home_page.dart';
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
                  "Agenda",
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
                    final route = MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HomePage();
                      },
                    );
                    Navigator.of(context).pushReplacement(route);
                  } else {
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
                            "Error al Iniciar Sesion, Constraseña o Correo Electronico Incorrecto",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    );
                    final route = MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginPage();
                      },
                    );
                    Navigator.of(context).pushReplacement(route);
                  }
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Aun no Tienes una Cuenta?",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              TextButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                    builder: (BuildContext context) {
                      return RegistroUsuarioPage();
                    },
                  );

                  Navigator.push(context, route);
                },
                child: Text(
                  "Registrate Aqui",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 15),
                ),
              )
            ],
          ),
          SizedBox(
            height: 80,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (BuildContext context) {
                  return BotonPanicoPage();
                },
              );
              Navigator.of(context).push(route);
            },
            child: Icon(
              MdiIcons.skullCrossbones,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration decoracionForm() {
    return BoxDecoration(
        color: Color(0xFFFFE1CCEC), borderRadius: BorderRadius.circular(10));
  }
}
