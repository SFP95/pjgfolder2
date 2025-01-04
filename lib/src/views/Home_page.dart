import 'package:flutter/material.dart';
import 'package:pjgfolder2/src/views/login_page.dart';

import 'character_list_page.dart';
import 'dice_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // Método para cambiar el índice y mostrar el contenido correspondiente
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Fondo transparente para el gradiente
      extendBodyBehindAppBar: true, // Esto asegura que el cuerpo se extienda detrás del AppBar
      body: Row(
        children: [
          Material(
            elevation: 0, // Sombra al NavigationRail
            child: NavigationRail(
              indicatorColor: Color.fromARGB(165, 69, 55, 80),
              backgroundColor: Color(0xFFB39DDB),
              selectedIndex: selectedIndex,
              onDestinationSelected: onItemTapped,
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.casino_rounded),
                  selectedIcon: Icon(Icons.casino_rounded, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Dice Rolls'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.auto_awesome),
                  selectedIcon: Icon(Icons.auto_awesome, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Spells'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bolt),
                  selectedIcon: Icon(Icons.bolt, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Combat'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.pets),
                  selectedIcon: Icon(Icons.pets, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Bestiary'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history_edu),
                  selectedIcon: Icon(Icons.history_edu, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Campaign'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle_outlined),
                  selectedIcon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Characters'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.login),
                  selectedIcon: Icon(Icons.login, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text(' Login | out'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFB39DDB), Color.fromARGB(255, 69, 55, 80)], // Gradiente de lavanda a morado
                ),
              ),
              child: IndexedStack(
                index: selectedIndex,  // Usamos el índice para determinar qué widget mostrar
                children: [
                  // Aquí puedes agregar los diferentes widgets para cada sección
                  DicePage(),
                  Center(
                    child: Text('Spells', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text('Combat', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text('Bestiary', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text('Campaign', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  CharacterListPage(),
                  LoginPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
