import 'package:agenda_tsi/login_page.dart';
import 'package:agenda_tsi/pages/tab_actividades.dart';
import 'package:agenda_tsi/pages/tab_calendario.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaSeleccionada = 0;
  List paginas = [TabActividades(), TabCalendario()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Container(
          child: Text('Bienvenido Usuario'),
        ),
        leading: IconButton(
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (BuildContext context) {
                  return LoginPage();
                },
              );
              Navigator.of(context).push(route);
            },
            icon: Icon(MdiIcons.logout)),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(MdiIcons.calendarWeek),
              icon: Icon(MdiIcons.calendarWeek),
              label: 'Ver Actividades'),
          NavigationDestination(
              selectedIcon: Icon(MdiIcons.calendar),
              icon: Icon(MdiIcons.calendar),
              label: 'Calendario'),
        ],
        selectedIndex: paginaSeleccionada,
        onDestinationSelected: (pagina) {
          setState(() {
            paginaSeleccionada = pagina;
          });
        },
      ),
      body: paginas[paginaSeleccionada],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(MdiIcons.plus, color: Colors.white),
        backgroundColor: Colors.blue.shade600,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
