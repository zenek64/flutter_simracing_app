import 'package:flutter/material.dart';
import 'package:flutter_simracing_app/calculator_screen.dart';
import 'package:flutter_simracing_app/times_screen.dart';
import 'color_schemes.g.dart';

class FuelCalculator extends StatefulWidget {
  const FuelCalculator({super.key});

  @override
  State<FuelCalculator> createState() {
    return __FuelCalculatorState();
  }
}

class __FuelCalculatorState extends State<FuelCalculator> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CalculatorScreen(),
    Times()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Lap Times',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
