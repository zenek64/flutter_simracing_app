import 'package:flutter/material.dart';

class FuelCalculator extends StatefulWidget {
  const FuelCalculator({super.key});

  @override
  State<FuelCalculator> createState() {
    return __FuelCalculatorState();
  }
}

class __FuelCalculatorState extends State<FuelCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SimRacing App'),
        ),
        body: Center(),
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
        ),
      ),
    );
  }
}
