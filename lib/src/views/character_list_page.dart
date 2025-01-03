import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import '../models/character/Character.dart';
import '../utils/http_utils.dart';

class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      // URL del endpoint de la API para obtener la lista de personajes
      String endpoint = 'characters';

      // Realiza una solicitud GET al servidor para obtener la lista de personajes
      http.Response response = await ApiClient().get(endpoint);

      if (response.statusCode == 200) {
        // Decodifica la respuesta JSON y crea instancias de Character
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

  Character generateRandomCharacter() {
    List<String> randomNames = ['John', 'Jane', 'David', 'Emma', 'Michael', 'Olivia'];
    List<String> randomSurnames = ['Smith', 'Johnson', 'Brown', 'Davis', 'Miller', 'Wilson'];
    List<String> randomRaces = ['Human', 'Elf', 'Dwarf', 'Orc', 'Gnome', 'Halfling'];

    Random random = Random();
    String randomName = randomNames[random.nextInt(randomNames.length)];
    String randomSurname = randomSurnames[random.nextInt(randomSurnames.length)];
    int randomAge = random.nextInt(100) + 1;
    String randomStory = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
    String randomStatistics = 'Strength: ${random.nextInt(10)}, Intelligence: ${random.nextInt(10)}, Agility: ${random.nextInt(10)}';
    String randomRace = randomRaces[random.nextInt(randomRaces.length)];

    return Character(randomName, randomSurname, randomAge, randomStory, randomStatistics, randomRace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[400],
          size: 30,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'List of Characters',
          style: TextStyle(fontSize: 30, color: Colors.grey[400]),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(30),
        itemCount: characters.length + 1, // Agregar 1 para el ejemplo de personaje aleatorio
        itemBuilder: (BuildContext context, int index) {
          if (index == characters.length) {
            // Índice del ejemplo de personaje aleatorio
            Character randomCharacter = generateRandomCharacter();

            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                title: Text(
                  randomCharacter.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30,
                  ),
                ),
                subtitle: Text(
                  randomCharacter.race,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/character_sheet');
                },
              ),
            );
          }

          Character character = characters[index];

          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListTile(
              title: Text(
                character.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 30,
                ),
              ),
              subtitle: Text(
                character.race,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
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
        backgroundColor: Colors.grey[400]?.withOpacity(0.3),
        onPressed: () {
          Navigator.pushNamed(context, '/character_creation');
        },
        child: Icon(Icons.add,color: Colors.deepPurple[100],),
      ),
    );
  }
}
