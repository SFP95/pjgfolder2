import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

import '../services/Auth_Service.dart';
import '../stores/UserPreferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _aliasController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final service = AuthService();

  @override
  void dispose() {
    _aliasController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register(String email, String password) {
    // Registration logic...

    // Generate the JWT token
    String token = generateToken();

    // Save the token to UserPreferences
    UserPreferences.saveToken(token);

    // Verify if the token has been saved correctly
    String? storedToken = UserPreferences.getToken() as String?;
    if (storedToken != null) {
      // The token has been saved successfully
      print('Token stored successfully: $storedToken');
      Navigator.popAndPushNamed(context, '/');
    } else {
      // Error storing the token
      print('Error storing the token');
    }
  }

  String generateToken() {
    final payload = {
      'userId': 123,
      'alias': _aliasController.text,
      'exp': DateTime.now().add(Duration(days: 7)).millisecondsSinceEpoch ~/ 1000, // Expires in 7 days
    };

    // Encode the payload as a JSON string
    String encodedPayload = json.encode(payload);

    // Generate a signature using a secret key
    List<int> key = utf8.encode('your_secret_key');
    Hmac hmac = Hmac(sha256, key);
    Digest signature = hmac.convert(utf8.encode(encodedPayload));

    // Concatenate the encoded payload and signature with a dot
    String token = '${base64Url.encode(utf8.encode(encodedPayload))}.${base64Url.encode(signature.bytes)}';

    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 55, 80),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 163, 147, 191),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 12, 9, 16),
                    ),
                    controller: _aliasController,
                    decoration: InputDecoration(labelText: 'User Name'),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 12, 9, 16),
                    ),
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color.fromARGB(255, 171, 155, 198)),
                  ),
                  onPressed: () async {
                    // Obtener los valores de los controladores
                    String alias = _aliasController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    var response = await service.register(alias, email, password);
                    if (response == null) {
                      print("RESPONSE ES NULO");
                    } else {
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
                  child: Text('Sign up',
                      style: TextStyle(
                          color: Color.fromARGB(255, 12, 9, 16),
                          fontSize: 30)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color.fromARGB(255, 171, 155, 198)),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
                  },
                  child: Text('Cancel',
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
