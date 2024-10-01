import 'package:agenda_tsi/BotonDePanico/borrar_usuarios_panico_page.dart';
import 'package:agenda_tsi/BotonDePanico/modificar_usuario_panico_page.dart';
import 'package:flutter/material.dart';

class BotonPanicoPage extends StatelessWidget {
  const BotonPanicoPage({super.key});

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
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final route = MaterialPageRoute(
                          builder: (BuildContext context) {
                            return BorrarUsuariosPanicoPage();
                          },
                        );
                        Navigator.of(context).push(route);
                      },
                      child: Text('Eliminar Un Usuario'),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ModificarUsuarioPanicoPage();
                            },
                          );
                          Navigator.of(context).push(route);
                        },
                        child: Text('Modificar Un Usuario'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
