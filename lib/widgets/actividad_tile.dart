// import 'package:f1_cliente/constants.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ActividadTile extends StatelessWidget {
  const ActividadTile({
    super.key,
    required this.id,
    // required this.id_usuario,
    required this.nombre_actividad,
    required this.descripcion,
    required this.id_categoria,
    required this.fecha_hora_inicio,
    // required this.fecha_hora_termino,
    // required this.recordatorio,
  });

  final int id;
  // final int id_usuario;
  final String nombre_actividad;
  final String descripcion;
  final int id_categoria;
  final String fecha_hora_inicio;
  // final DateTime fecha_hora_termino;
  // final DateTime recordatorio;

  @override
  Widget build(BuildContext context) {
    // TextStyle estiloNumero = GoogleFonts.oxanium(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade600));

    // TextStyle estiloNombre = GoogleFonts.oxanium(textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16));
    // TextStyle estiloApellido = GoogleFonts.oxanium(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
    // TextStyle estiloEquipo = GoogleFonts.oxanium(textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12));

    // TextStyle estiloPuntos = GoogleFonts.oxanium(textStyle: TextStyle(color: Colors.black87, fontSize: 12));
    // TextStyle estiloValorPuntos = GoogleFonts.oxanium(textStyle: TextStyle(fontWeight: FontWeight.bold));

    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 4),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(3),
          bottomRight: Radius.circular(3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            alignment: Alignment.center,
            child: Text(this.fecha_hora_inicio.toString()),
          ),
          VerticalDivider(
            // color: Color(this.id_usuario),
            thickness: 4,
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                  children: [
                    TextSpan(text: ' '),
                    TextSpan(text: this.nombre_actividad),
                  ],
                ),
              ),
              Text(this.descripcion.toString()),
            ],
          ),
          Spacer(),
          Container(
            // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            // decoration: BoxDecoration(
            //   color: Colors.grey.shade200,
            //   borderRadius: BorderRadius.circular(15),
            // ),
            // child: RichText(
            //   // text: TextSpan(
            //   //   // // style: estiloPuntos,
            //   //   // children: [
            //   //   //   // TextSpan(text: this.fecha_hora_inicio.toString()),
            //   //   //   TextSpan(text: ' PTS'),
            //   //   // ],
            //   // ),
            // ),
          ),
          Icon(Icons.keyboard_arrow_right, color: Colors.purple.shade300),
        ],
      ),
    );
  }
}
