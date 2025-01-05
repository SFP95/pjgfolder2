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
                  icon: Icon(Icons.casino_rounded, color: Color(0xFF2E1A39)),  // Color suave para íconos no seleccionados
                  selectedIcon: Icon(Icons.casino_rounded, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Dice Rolls', style: TextStyle(color: Color(0xFF2E1A39))),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.auto_awesome, color: Color(0xFF2E1A39)),
                  selectedIcon: Icon(Icons.auto_awesome, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Spells', style: TextStyle(color: Color(0xFF2E1A39))),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bolt, color: Color(0xFF2E1A39)),
                  selectedIcon: Icon(Icons.bolt, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Combat', style: TextStyle(color: Color(0xFF2E1A39))),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.pets, color: Color(0xFF2E1A39)),
                  selectedIcon: Icon(Icons.pets, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Bestiary', style: TextStyle(color: Color(0xFF2E1A39))),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history_edu, color: Color(0xFF2E1A39)),
                  selectedIcon: Icon(Icons.history_edu, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Campaign', style: TextStyle(color: Color(0xFF2E1A39))),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle_outlined, color: Color(0xFF2E1A39)),
                  selectedIcon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Characters', style: TextStyle(color: Color(0xFF2E1A39))),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.login, color: Color(0xFF2E1A39)),
                  selectedIcon: Icon(Icons.login, color: Color.fromARGB(255, 69, 55, 80)),
                  label: Text('Login | out', style: TextStyle(color: Color(0xFF2E1A39))),
                ),
              ],
              elevation: 8,  // Agregar sombra
              minWidth: 80,  // Ajuste de ancho para un diseño más compacto
              selectedLabelTextStyle: TextStyle(
                color: Color.fromARGB(255, 69, 55, 80),  // Color de las etiquetas seleccionadas
              ),
              unselectedLabelTextStyle: TextStyle(
                color: Color(0xFF2E1A39),  // Color de las etiquetas no seleccionadas
              ),
              leading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(165, 69, 55, 80),
                  child: Icon(Icons.person, color: Color(0xFF2E1A39)),  // Avatar con color contrastante
                ),
              ),
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
