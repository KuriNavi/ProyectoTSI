import 'package:agenda_tsi/services/actividades_service.dart';
import 'package:agenda_tsi/widgets/actividad_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabActividades extends StatefulWidget {
  const TabActividades({super.key});

  @override
  State<TabActividades> createState() => _TabActividadesState();
}

class _TabActividadesState extends State<TabActividades> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/drivers_bg.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: FutureBuilder(
          future: ActividadesService().ActividadesPorFecha(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
              //esperanding datos
              return Center(
                // child: Text('Esperando Datos...', style: TextStyle(color: Colors.white)),
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            //llegaron los datos
            //mostrar
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var actividad = snapshot.data[index];
                return ActividadTile(
                  id: actividad['id'],
                  // id_usuario: actividad['id_usuario'],
                  nombre_actividad: actividad['nombre_actividad'],
                  descripcion: actividad['descripcion'],
                  id_categoria: actividad['id_categoria'],
                  fecha_hora_inicio: actividad['fecha_hora_inicio'.toString()],
                );
              },
            );
          },
        ),
      ),
    );
  }
}