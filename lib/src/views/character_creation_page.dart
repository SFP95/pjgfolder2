import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/http_utils.dart';

class CharacterCreationPage extends StatefulWidget {
  @override
  _CharacterCreationPageState createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  late String _selectedRace = 'Gnome';
  String _historiaValue = '';
  TextEditingController _historiaController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _strengthController = TextEditingController();
  final TextEditingController _agilityController = TextEditingController();
  final TextEditingController _intelligenceController = TextEditingController();
  final TextEditingController _characteristicsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _ageController.dispose();
    _speedController.dispose();
    _strengthController.dispose();
    _agilityController.dispose();
    _intelligenceController.dispose();
    _characteristicsController.dispose();
    _historiaController.dispose();
    super.dispose();
  }

  Widget customTextField(String hintText, bool isNumeric, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      maxLines:3,
      scrollPadding: EdgeInsets.symmetric(vertical: 10),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        if (isNumeric) {
          final number = num.tryParse(value);
          if (number == null) {
            return 'Please enter a valid number';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.deepPurple.shade400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Colors.deepPurple.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.deepPurple.shade200,
          ),
        ),
      ),
    );
  }

  TextFormField customCharacteristics(
      String hintText,
      Function(String) onChanged,
      TextEditingController controller,
      ) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      textDirection: TextDirection.ltr, // Agrega esta línea
      maxLines: 1,
      scrollPadding: EdgeInsets.symmetric(vertical: 10),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.deepPurple.shade400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade500,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  TextFormField customHistori(
      String hintText,
      bool isNumeric,
      Function(String) onChanged,
      TextEditingController controller,
      ) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      maxLines: 1,
      scrollPadding: EdgeInsets.symmetric(vertical: 10),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.deepPurple.shade400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Colors.deepPurple.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.deepPurple.shade200,
          ),
        ),
      ),
    );
  }

  void saveCharacter() async {
    // Crear un objeto ApiClient
    final apiClient = ApiClient();

    // Construir el cuerpo de la solicitud con los datos del personaje
    final body = {
      'name': _nameController.text,
      'race': _selectedRace,
      'speed': _speedController.text,
      'strength': _strengthController.text,
      'agility': _agilityController.text,
      'intelligence': _intelligenceController.text,
      'characteristics': _characteristicsController.text,
      'history': _historiaController.text,
    };

    // Realizar la solicitud POST a la API utilizando ApiClient
    final response = await apiClient.post('characters', body: body);

    // Verificar el código de respuesta
    if (response.statusCode == 201) {
      // El personaje se guardó correctamente
      print('Personaje guardado exitosamente');
    } else {
      // Hubo un error al guardar el personaje
      print('Error al guardar el personaje. Código de respuesta: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[400]),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Character Creation',
          style: TextStyle(fontSize: 25, color: Colors.grey[400]),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/perfil.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Divider(height: 30, color: Colors.grey[400]),
                  customTextField("Enter the name", false, _nameController),
                  Divider(height: 30, color: Colors.grey[400]),
                  customTextField("Enter the last name", false, _surnameController),
                  Divider(height: 30, color: Colors.grey[400]),
                  customTextField("Enter age", true, _ageController),
                  Divider(height: 30, color: Colors.grey[400]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Race: ",
                        style:
                        TextStyle(color: Colors.grey[800], fontSize: 20),
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.grey[400],
                        style:
                        TextStyle(color: Colors.grey[800], fontSize: 20),
                        borderRadius: BorderRadius.circular(30),
                        value: _selectedRace,
                        items: [
                          'Gnome',
                          'Elf',
                          'Mage',
                          'Necromancer',
                          'Dwarf',
                          'Dragonborn',
                          'Half-Orc',
                          'Human',
                          'Halfling',
                          'Half-Elf',
                          'Tifling',
                        ].map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRace = newValue ?? 'Gnome';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Stats",
                    style: TextStyle(fontSize: 30, color: Colors.grey[800]),
                  ),
                  Divider(height: 30, color: Colors.grey[400]),
                  customTextField("Speed Value", true, _speedController),
                  Divider(height: 30, color: Colors.grey[400]),
                  customTextField("Strength Value", true, _strengthController),
                  Divider(height: 30, color: Colors.grey[400]),
                  customTextField("Agility Value", true, _agilityController),
                  Divider(height: 30, color: Colors.grey[400]),
                  customTextField(
                      "Intelligence Value", true, _intelligenceController),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Text(
                    "Characteristics",
                    style: TextStyle(fontSize: 30, color: Colors.grey[800]),
                  ),
                  Divider(height: 30, color: Colors.grey[400]),
                  customCharacteristics(
                    "Enter the characteristics",
                        (value) {
                      setState(() {
                        _characteristicsController.text = value;
                      });
                    },
                    _characteristicsController,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Text(
                    "History",
                    style: TextStyle(fontSize: 30, color: Colors.grey[800]),
                  ),
                  Divider(height: 30, color: Colors.grey[400]),
                  customHistori(
                    "Enter the story",
                    false,
                        (value) {
                      setState(() {
                        _historiaValue = value;
                      });
                    },
                    _historiaController,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.grey[400]
                        ?.withOpacity(0.3),
                    onPressed: saveCharacter,
                    child: Icon(Icons.save,
                        color: Colors.deepPurple[100]),
                  ),
                  SizedBox(width: 30),
                  FloatingActionButton(
                    backgroundColor: Colors.grey[400]
                        ?.withOpacity(0.3),
                    onPressed: (){Navigator.popAndPushNamed(context, '/characters_list');},
                    child: Icon(Icons.cancel,
                        color: Colors.deepPurple[100]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
