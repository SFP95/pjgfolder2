import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pjgfolder2/src/views/character_creation_page.dart';
import 'dart:convert';
import '../models/character/Character.dart';
import '../utils/http_utils.dart';

class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  List<Character> characters = [];
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _surname = '';
  int _age = 18;
  String _race = 'Human';
  String _story = '';
  String _statistics = 'Strength: 5, Intelligence: 5, Agility: 5';

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      String endpoint = 'characters'; // URL del endpoint de la API
      http.Response response = await ApiClient().get(endpoint);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Character> fetchedCharacters = data.map((item) => Character.fromJson(item)).toList();

        setState(() {
          characters = fetchedCharacters;
        });
      } else {
        print('Error al obtener la lista de personajes. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener la lista de personajes: $e');
    }
  }

  // Método para abrir el diálogo de creación de personaje
  void _openCharacterCreationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Color.fromARGB(255, 69, 55, 80),
            content: SizedBox(
            width: 750, // Permite que el contenido ocupe más espacio
            child: CharacterCreationPage(),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB39DDB),  // Fondo lavanda claro
      body: characters.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: characters.length, // Ahora muestra todos los personajes
        itemBuilder: (BuildContext context, int index) {
          Character character = characters[index];

          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF2E1A39),  // Morado oscuro
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                character.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                character.race,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/character_sheet');
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 69, 55, 80),  // Morado oscuro
        onPressed: _openCharacterCreationDialog, // Mostrar el diálogo para crear un personaje
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
