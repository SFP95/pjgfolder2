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
      style: TextStyle(
        fontSize: 10,
        color: Color.fromARGB(255, 69, 55, 80)
      ),
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
        hintStyle: TextStyle(color: Color(0xFFB39DDB)), // Lavanda claro
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF7E4B8B), // Morado oscuro
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF7E4B8B), // Morado oscuro
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
      textDirection: TextDirection.ltr,
      maxLines: 10,
      scrollPadding: EdgeInsets.symmetric(vertical: 10),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFFB39DDB)), // Lavanda claro
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
      maxLines: 10,
      scrollPadding: EdgeInsets.symmetric(vertical: 10),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFFB39DDB)), // Lavanda claro
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF7E4B8B), // Morado oscuro
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF7E4B8B), // Morado oscuro
          ),
        ),
      ),
    );
  }

  void saveCharacter() async {
    final apiClient = ApiClient();
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

    final response = await apiClient.post('characters', body: body);

    if (response.statusCode == 201) {
      print('Personaje guardado exitosamente');
    } else {
      print('Error al guardar el personaje. Código de respuesta: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 55, 80), // Morado oscuro
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(80, 10, 80, 30),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Color(0xFFB39DDB), // Lavanda claro
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  customTextField("Enter the name", false, _nameController),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customTextField("Enter the last name", false, _surnameController),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customTextField("Enter age", true, _ageController),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Race: ",
                        style: TextStyle(color: Colors.grey[800], fontSize: 20),
                      ),
                      DropdownButton<String>(
                        dropdownColor: Color(0xFFB39DDB), // Lavanda claro
                        style: TextStyle(color: Colors.grey[800], fontSize: 20),
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
              margin: EdgeInsets.fromLTRB(80, 10, 80, 30),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Color(0xFFB39DDB), // Lavanda claro
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Text(
                    "Stats",
                    style: TextStyle(fontSize: 30, color: Colors.grey[800]),
                  ),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customTextField("Speed Value", true, _speedController),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customTextField("Strength Value", true, _strengthController),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customTextField("Agility Value", true, _agilityController),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customTextField("Intelligence Value", true, _intelligenceController),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(80, 10, 80, 30),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Color(0xFFB39DDB), // Lavanda claro
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Text(
                    "Characteristics",
                    style: TextStyle(fontSize: 30, color: Colors.grey[800]),
                  ),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customCharacteristics("Enter the characteristics", (value) {
                    setState(() {
                      _characteristicsController.text = value;
                    });
                  }, _characteristicsController),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(80, 10, 80, 5),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Color(0xFFB39DDB), // Lavanda claro
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Text(
                    "History",
                    style: TextStyle(fontSize: 30, color: Colors.grey[800]),
                  ),
                  Divider(height: 30, color: Color.fromARGB(255, 69, 55, 80)),
                  customHistori("Enter history", false, (value) {
                    setState(() {
                      _historiaController.text = value;
                    });
                  }, _historiaController),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: saveCharacter,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Color.fromARGB(255, 69, 55, 80), // Morado oscuro
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Save Character',style: TextStyle(color: Color(0xFFB39DDB),fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
