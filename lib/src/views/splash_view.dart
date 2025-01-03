import 'dart:async';
import 'package:flutter/material.dart';

import '../services/Auth_Service.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashView createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  final AuthService _authService = AuthService();

  void initState() {
    super.initState();
    checkAuthentication();
  }

  void checkAuthentication() async {
    // Aquí puedes implementar tu lógica para verificar la autenticación
    // Puedes utilizar SharedPreferences, tokens almacenados localmente, etc.

    bool isAuthenticated = await _authService.isAuthenticated();

    // Espera un tiempo para mostrar la pantalla de splash
    await Future.delayed(Duration(seconds: 2));

    if (isAuthenticated) {
      // Usuario autenticado, navegar a la pantalla principal
      //Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Usuario no autenticado, navegar a la pantalla de inicio de sesión
//Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 9, 16),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity:  0.6,
              child: Image.asset(
                'assets/images/d20.png',
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 90),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 290),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
              ),
              child:
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(
                      234, 171, 155, 198)),
                  backgroundColor: Color.fromARGB(255, 69, 55, 80),
                  minHeight: 4,
                ),
              ),
            ),

            // ProgressBar
          ],
        ),
      ),
    );
  }
}
