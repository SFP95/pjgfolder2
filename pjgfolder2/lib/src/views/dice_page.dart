import 'dart:math';
import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin {
  int _selectedDice = 20;
  int _diceCount = 1;
  int _result = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _rollDice() async {
    _animationController.reset();
    _animationController.forward();

    await Future.delayed(Duration(milliseconds: 500));
    int sum = 0;
    for (int i = 0; i < _diceCount; i++) {
      sum += Random().nextInt(_selectedDice) + 1;
    }

    setState(() {
      _result = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cabecera con ícono
                Column(
                  children: [
                    Icon(Icons.casino, size: 100, color: Color.fromARGB(255, 41, 33, 47)),
                    SizedBox(height: 10),
                    Text(
                      'Roll Your Dice!',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Color(0xFF2E1A39)),
                    ),
                  ],
                ),
                // Configuración de dados
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 300.0), // Márgenes exteriores a la izquierda y derecha
                  child: Card(
                    color: Color(0x9BC8BCCC), // Fondo claro para contraste
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 150), // Más compacto
                      child: Column(
                        children: [
                          _buildDropdownRow(
                            'Number of die faces:',
                            _selectedDice,
                            [4, 6, 8, 10, 12, 20],
                                (int? newValue) {
                              setState(() => _selectedDice = newValue ?? 4);
                            },
                          ),
                          SizedBox(height: 20),
                          _buildDropdownRow(
                            'Number of dice:',
                            _diceCount,
                            List.generate(10, (i) => i + 1),
                                (int? newValue) {
                              setState(() => _diceCount = newValue ?? 1);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Botón de lanzamiento y resultado
                Card(
                  color: Color(0x9BC8BCCC), // Fondo claro para contraste
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: _rollDice,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2E1A39), // Fondo oscuro
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                          ),
                          child: Text('Roll', style: TextStyle(fontSize: 20, color: Color(0xFFCFBBD3))),
                        ),
                        SizedBox(height: 20),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            double scale = 1 + _animationController.value * 0.2;
                            return Transform.scale(
                              scale: scale,
                              child: Text(
                                'Result: $_result',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E1A39), // Texto oscuro
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownRow(String label, int value, List<int> items, ValueChanged<int?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 30, color: Color(0xFF2E1A39))),
        DropdownButton<int>(
          borderRadius: BorderRadius.circular(30),
          focusColor: Color(0x9BC8BCCC),
          dropdownColor: Color(0x9BC8BCCC),
          value: value,
          items: items
              .map((item) => DropdownMenuItem<int>(
            value: item,
            child: Text(
              'D$item',
              style: TextStyle(fontSize: 30, color: Color(0xFF2E1A39)),
            ),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
