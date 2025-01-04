import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Fondo transparente para el gradiente
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent, // AppBar transparente
        //title: Text("Rol App", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFB39DDB), Color.fromARGB(255, 69, 55, 80)], // Gradiente de lavanda a morado
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 150, 28, 28),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                crossAxisCount: 2,
                padding: EdgeInsets.all(40),
                children: [
                  Tooltip(
                    message: "DADOS",
                    child: Column(
                      children: [
                    Padding(padding: const EdgeInsets.only(top: 80.0),
                child:
                        IconButton(
                          iconSize: 20,
                          onPressed: () {
                            Navigator.pushNamed(context, '/dice');
                          },
                          icon: Image.asset(
                            'assets/images/dado.png',
                            width: 390,  // Ajusta el ancho de la imagen
                            height: 370, // Ajusta la altura de la imagen
                            color: Color.fromARGB(231, 12, 9, 16),
                          ),
                        ),
                    ),
                        Text(
                          "Dice",
                          style: TextStyle(
                            fontSize: 45,
                            color: Color.fromARGB(255, 12, 9, 16),
                            shadows: [
                              Shadow(offset: Offset(2.0, 2.0), color: Colors.black.withOpacity(0.5), blurRadius: 4)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tooltip(
                    message: "Lista de Personajes",
                    child: Column(
                      children: [
                    Padding(padding: const EdgeInsets.only(top: 80.0),
                    child:
                        IconButton(
                          iconSize: 60,
                          onPressed: () {
                            Navigator.pushNamed(context, '/characters_list');
                          },
                          icon: Image.asset(
                            'assets/images/nota.png',
                            width: 390,  // Ajusta el ancho de la imagen
                            height: 370, // Ajusta la altura de la imagen
                            color: Color.fromARGB(231, 12, 9, 16),
                          ),
                        ),
                    ),
                        Text(
                          "Characters",
                          style: TextStyle(
                            fontSize: 45,
                            color: Color.fromARGB(255, 12, 9, 16),
                            shadows: [
                              Shadow(offset: Offset(2.0, 2.0), color: Colors.black.withOpacity(0.5), blurRadius: 4)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Tooltip(
                    message: 'Log Out',
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0), // Margen de 20 unidades arriba
                          child:  IconButton(
                            iconSize: 400, // Aumenta el tamaño del icono aquí
                            onPressed: () {
                              logout();
                            },
                            icon: Icon(
                              Icons.logout,
                              size: 350,  // Ajusta el tamaño aquí también
                              color: Color.fromARGB(231, 12, 9, 16),
                            ),
                          ),
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 45,
                            color: Color.fromARGB(255, 12, 9, 16),
                            shadows: [
                              Shadow(offset: Offset(2.0, 2.0), color: Colors.black.withOpacity(0.5), blurRadius: 4)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tooltip(
                    message: "Log / Sing In",
                    child: Column(
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 80.0),
                          child:
                          IconButton(
                            iconSize: 90,
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            icon: Image.asset(
                              'assets/images/perfil.png',
                              width: 390,  // Ajusta el ancho de la imagen
                              height: 370, // Ajusta la altura de la imagen
                              color: Color.fromARGB(231, 12, 9, 16),
                            ),
                          ),),

                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 45,
                            color: Color.fromARGB(255, 12, 9, 16),
                            shadows: [
                              Shadow(offset: Offset(2.0, 2.0), color: Colors.black.withOpacity(0.5), blurRadius: 4)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
