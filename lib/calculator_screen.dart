import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var myController = TextEditingController();

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Enter your number"),
            keyboardType: TextInputType.number,
            controller: myController,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 100,
              height: 70,
              child: TextField(
                decoration:
                    const InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.number,
                controller: myController,
              ),
            ),
            Container(
              width: 100,
              height: 70,
              child: TextField(
                decoration:
                    const InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.number,
                controller: myController,
              ),
            ),
            Container(
              width: 100,
              height: 70,
              child: TextField(
                decoration:
                    const InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.number,
                controller: myController,
              ),
            )
          ]),
          TextField(
            decoration: const InputDecoration(labelText: "Enter your number"),
            keyboardType: TextInputType.number,
            controller: myController,
          )
        ],
      ),
    );
  }
}
