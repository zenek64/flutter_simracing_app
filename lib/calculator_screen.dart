import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _raceLengthController = TextEditingController();
  final _minutesController = TextEditingController();
  final _secController = TextEditingController();
  final _fuelController = TextEditingController();
  int raceLength = 0;
  int time = 0;
  double fuel = 0;
  double results = 0;
  void oblicz() {
    setState(() {
      time = Duration(
              minutes: int.parse(_minutesController.text),
              seconds: int.parse(_secController.text))
          .inSeconds;
      fuel = double.parse(_fuelController.text);
      raceLength =
          Duration(minutes: int.parse(_raceLengthController.text)).inSeconds;
      results = ((raceLength / time) * fuel);
    });
  }

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Race Length"),
            keyboardType: TextInputType.number,
            controller: _raceLengthController,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              width: 150,
              height: 70,
              child: TextField(
                decoration:
                    const InputDecoration(labelText: "Lap Time (minutes)"),
                keyboardType: TextInputType.number,
                controller: _minutesController,
              ),
            ),
            SizedBox(
              width: 150,
              height: 70,
              child: TextField(
                decoration: const InputDecoration(labelText: "Lap Time (sec)"),
                keyboardType: TextInputType.number,
                controller: _secController,
              ),
            )
          ]),
          SizedBox(
            child: TextField(
              decoration: const InputDecoration(labelText: "Fuel per lap"),
              keyboardType: TextInputType.number,
              controller: _fuelController,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFD1E4FF),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(children: [
              Row(
                children: [
                  const Text("Minimum fuel: "),
                  Text(results.toStringAsFixed(2))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text("Recommended fuel: "),
                  Text((results + fuel).toStringAsFixed(2))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text("Safe: "),
                  Text((results + fuel * 2).toStringAsFixed(2))
                ],
              )
            ]),
          ),
          const SizedBox(height: 8),
          FilledButton(onPressed: oblicz, child: const Text('Calculate'))
        ],
      ),
    );
  }
}
