import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterSheetPage extends StatefulWidget {
  @override
  _CharacterSheetPageState createState() => _CharacterSheetPageState();
}

class _CharacterSheetPageState extends State<CharacterSheetPage> {
  int _speedValue = 0;
  int _forceValue = 0;
  int _agilityValue = 0;
  int _intelligenceValue = 0;
  int _originalSpeedValue = 0;
  int _originalForceValue = 0;
  int _originalAgilityValue = 0;
  int _originalIntelligenceValue = 0;
  int _savedSpeedValue = 0;
  int _savedForceValue = 0;
  int _savedAgilityValue = 0;
  int _savedIntelligenceValue = 0;

  @override
  void initState() {
    super.initState();
    _originalSpeedValue = _speedValue;
    _originalForceValue = _forceValue;
    _originalAgilityValue = _agilityValue;
    _originalIntelligenceValue = _intelligenceValue;
    _savedSpeedValue = _speedValue;
    _savedForceValue = _forceValue;
    _savedAgilityValue = _agilityValue;
    _savedIntelligenceValue = _intelligenceValue;
  }

  void incrementValue(String stat) {
    if (_speedValue == _savedSpeedValue &&
        _forceValue == _savedForceValue &&
        _agilityValue == _savedAgilityValue &&
        _intelligenceValue == _savedIntelligenceValue) {
      setState(() {
        if (stat == 'speed') {
          _speedValue++;
        } else if (stat == 'force') {
          _forceValue++;
        } else if (stat == 'agility') {
          _agilityValue++;
        } else if (stat == 'intelligence') {
          _intelligenceValue++;
        }

        // Actualizar los valores guardados
        _savedSpeedValue = _speedValue;
        _savedForceValue = _forceValue;
        _savedAgilityValue = _agilityValue;
        _savedIntelligenceValue = _intelligenceValue;
      });
    }
  }

  void decrementValue(String stat) {
    if (_speedValue == _savedSpeedValue &&
        _forceValue == _savedForceValue &&
        _agilityValue == _savedAgilityValue &&
        _intelligenceValue == _savedIntelligenceValue) {
      setState(() {
        if (stat == 'speed') {
          _speedValue--;
        } else if (stat == 'force') {
          _forceValue--;
        } else if (stat == 'agility') {
          _agilityValue--;
        } else if (stat == 'intelligence') {
          _intelligenceValue--;
        }

        // Actualizar los valores guardados
        _savedSpeedValue = _speedValue;
        _savedForceValue = _forceValue;
        _savedAgilityValue = _agilityValue;
        _savedIntelligenceValue = _intelligenceValue;
      });
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
        title: Text('Character File', style: TextStyle(fontSize: 30, color: Colors.grey[400])),
        backgroundColor: Colors.grey.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    maxRadius: 80,
                    backgroundColor: Colors.grey[800],
                    child: Image.asset(
                      "assets/images/perfil.png",
                      color: Colors.grey[400],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("NAME", style: TextStyle(fontSize: 30, color: Colors.grey[800])),
                      Text("LAST NAME", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                      Text("AGE", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                      Text("RACE", style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 40, 40, 40),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[400],
              ),
              child: Column(
                children: [
                  Text("STATS", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                  Divider(color: Colors.grey[400], height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Speed :", style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                          Divider(height: 25),
                          Text("Force :", style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                          Divider(height: 25),
                          Text("Agility :", style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                          Divider(height: 25),
                          Text("Intelligence :", style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () => decrementValue('speed'),
                                      child: Icon(Icons.remove),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                    Text("   $_savedSpeedValue   ", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                                    FloatingActionButton(
                                      onPressed: () => incrementValue('speed'),
                                      child: Icon(Icons.add),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () => decrementValue('force'),
                                      child: Icon(Icons.remove),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                    Text("   $_savedForceValue   ", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                                    FloatingActionButton(
                                      onPressed: () => incrementValue('force'),
                                      child: Icon(Icons.add),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () => decrementValue('agility'),
                                      child: Icon(Icons.remove),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                    Text("   $_savedAgilityValue   ", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                                    FloatingActionButton(
                                      onPressed: () => incrementValue('agility'),
                                      child: Icon(Icons.add),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () => decrementValue('intelligence'),
                                      child: Icon(Icons.remove),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                    Text("   $_savedIntelligenceValue   ", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                                    FloatingActionButton(
                                      onPressed: () => incrementValue('intelligence'),
                                      child: Icon(Icons.add),
                                      backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.deepPurple[100],
                                      mini: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 40, 40, 40),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[400],
              ),
              child: Column(
                children: [
                  Text("Characteristics", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                  Divider(color: Colors.grey[400], height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("......\n", style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 40, 40, 40),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[400],
              ),
              child: Column(
                children: [
                  Text("History", style: TextStyle(fontSize: 25, color: Colors.grey[800])),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(60),
                    child: Text("....................................\n"),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.grey[400]?.withOpacity(0.3),
                      onPressed: () {
                        print('Valor de speed: $_originalSpeedValue');
                        print('Valor de force: $_originalForceValue');
                        print('Valor de agility: $_originalAgilityValue');
                        print('Valor de intelligence: $_originalIntelligenceValue');
                        // Implementar la lógica de guardado aquí
                        /**
                         * // Implementar la lógica de guardado aquí
                            print('Valor de la historia: $_historiaValue');
                         */
                      },
                      child: Icon(Icons.save,color: Colors.deepPurple[100],),
                    ),
                    const SizedBox(height: 30),
                    FloatingActionButton(
                      backgroundColor: Colors.grey[400]?.withOpacity(0.3),
                      onPressed: () {
                        Navigator.pushNamed(context, '/character_edit');
                      },
                      child: Icon(Icons.edit, size: 30, color: Colors.deepPurple[100],),
                    ),


                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
