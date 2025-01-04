import 'package:flutter/material.dart';
import 'package:pjgfolder2/src/views/register_page.dart';
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
      backgroundColor: Color(0xFFB39DDB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB39DDB),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 163, 147, 191),
          size: 30,
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimiza el tamaño de la columna
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 200,
              color:Color.fromARGB(255, 69, 55, 80)
            ),
            SizedBox(height: 20), // Espacio entre el icono y el siguiente widget
            Container(
              margin: EdgeInsets.fromLTRB(380, 0, 380, 70),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                 // color: Color.fromARGB(255, 69, 55, 80),
                  borderRadius:BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [Color.fromARGB(255, 69, 55, 80), Color.fromARGB(
                      255, 32, 24, 35)])
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(80, 10, 80, 30),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFB39DDB),
                      ),
                      controller: _emailController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xFFB39DDB),
                            )
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 30,
                            color: Color(0xFFB39DDB),
                          )
                      ),
                    ),
                    SizedBox(height: 15), // Espacio vertical de 20 píxeles
                    TextFormField(
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFB39DDB),
                      ),
                      controller: _passwordController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xFFB39DDB),
                              )
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 30,
                            color: Color(0xFFB39DDB),
                          )),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 70.0,
              children: [
                ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 69, 55, 80)),
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
                        color: Color(0xFFB39DDB),
                        fontSize: 28)),
                ),
                ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 69, 55, 80)),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 41, 33, 47),
                          content: SizedBox(
                            width: 750, // Permite que el contenido ocupe más espacio
                            child: RegisterPage(), // Vista de registro que mostrarás en el popup
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Cierra el popup
                              },
                              child: Text('Close',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 163, 147, 191),
                                      fontSize: 28)),
                            ),
                          ],
                        );
                      }
                    );

                   // Navigator.popAndPushNamed(context, '/register');
                  },
                  child: Text('Register',
                      style: TextStyle(
                          color: Color(0xFFB39DDB),
                          fontSize: 28)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
