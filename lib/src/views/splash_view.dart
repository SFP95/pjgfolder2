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
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Usuario no autenticado, navegar a la pantalla de inicio de sesión
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/d20.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 70),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.grey[400],
                  minHeight: 20,
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
