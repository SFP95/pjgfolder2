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
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true, // Esto asegura que el cuerpo se extienda detrás del AppBar
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB39DDB), // Lavanda claro
              Color.fromARGB(255, 69, 55, 80), // Morado oscuro
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max, // Minimiza el tamaño de la columna
            children: <Widget>[
              SizedBox(height: 30), // Espacio entre el icono y el siguiente widget
              Icon(
                  Icons.account_circle,
                  size: 150,
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
                      // Espacio vertical de 20 píxeles
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
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 69, 55, 80)),
                    ),
                    onPressed: () async {
                      print("LOGIN LLAMADO");
                      var response = await service.login(_emailController.text, _passwordController.text);
                      if (response == null) {
                        print("RESPONSE ES NULO");
                      }
                      if (response != null) {
                        print("RESPONSE NO NULO, ENTRO");
                        await UserPreferences.saveUserCredentials(response.user, response.token);

                        Navigator.popAndPushNamed(context, '/'); // Navegar a la página de inicio y eliminar todas las rutas anteriores
                      }
                    },
                    child: Text('Log in',
                        style: TextStyle(
                            color: Color(0xFFB39DDB),
                            fontSize: 28)),
                  ),
                  SizedBox(width: 20), // Espacio entre los dos botones
                  ElevatedButton(
                    style: ButtonStyle(
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
      ),
    );
  }
}