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
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[800],
        iconTheme: IconThemeData(
          color: Colors.grey[400],
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
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius:BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[800],
                    ),
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[800],
                    ),
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade400),
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
                  child: Text('Log in', style: TextStyle(color: Colors.grey[800],fontSize: 20)),
                ),
                ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade400),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/register');
                  },
                  child: Text('Register', style: TextStyle(color: Colors.grey[800],fontSize: 20)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
