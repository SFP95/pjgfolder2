import 'package:flutter/material.dart';
import '../services/Auth_Service.dart';
import '../stores/UserPreferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final service = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 55, 80),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 69, 55, 80),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 163, 147, 191),
          size: 30,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded), // Icono a mostrar
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 163, 147, 191),
                  borderRadius:BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 12, 9, 16),
                    ),
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email'),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 12, 9, 16),
                    ),
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 163, 147, 191)),
                   ),
                  onPressed: () async {
                    print("LOGIN LLAMADO");
                    var response = await service.login(_emailController.text, _passwordController.text);
                    if (response == null){
                      print("RESPONSE ES NULO");
                    }
                    if (response != null) {
                      // Guardar las credenciales del usuario
                      print("RESPONSE NO NULO, ENTRO");
                      await UserPreferences.saveUserCredentials(response.user, response.token);

                      Navigator.popAndPushNamed(context, '/'); // Navegar a la página de inicio y eliminar todas las rutas anteriores

                      /*// Prueba de comprobación de recogida de user y token
                      int? userId = await UserPreferences.getUserId();
                      String? token = await UserPreferences.getToken();
                      print('User ID: $userId');
                      print('Token: $token');*/
                    }

                  },
                  child: Text('Log in',
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 9, 16),
                        fontSize: 30)),
                ),
                ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 163, 147, 191)),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/register');
                  },
                  child: Text('Register',
                      style: TextStyle(
                          color: Color.fromARGB(255, 12, 9, 16),
                          fontSize: 30)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
