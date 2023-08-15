import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var raceLengthController = TextEditingController();
  var minutesController = TextEditingController();
  var secController = TextEditingController();
  var fuelController = TextEditingController();
  int raceLength = 0;
  int time = 0;
  double fuel = 0;
  double results = 0;
  void oblicz() {
    setState(() {
      time = Duration(
              minutes: int.parse(minutesController.text),
              seconds: int.parse(secController.text))
          .inSeconds;
      fuel = double.parse(fuelController.text);
      raceLength =
          Duration(minutes: int.parse(raceLengthController.text)).inSeconds;
      results = ((raceLength / time) * fuel);
    });
  }

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Race Length"),
            keyboardType: TextInputType.number,
            controller: raceLengthController,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 100,
              height: 70,
              child: TextField(
                decoration:
                    const InputDecoration(labelText: "Lap Time (minutes)"),
                keyboardType: TextInputType.number,
                controller: minutesController,
              ),
            ),
            Container(
              width: 100,
              height: 70,
              child: TextField(
                decoration: const InputDecoration(labelText: "Lap Time (sec)"),
                keyboardType: TextInputType.number,
                controller: secController,
              ),
            )
          ]),
          Container(
            child: TextField(
              decoration: const InputDecoration(labelText: "Fuel per lap"),
              keyboardType: TextInputType.number,
              controller: fuelController,
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFFD1E4FF)),
            width: double.infinity,
            child: Column(children: [
              Row(
                children: [Text("Minimum fuel"), Text(results.toString())],
              ),
              Row(
                children: [
                  Text("Recommended fuel"),
                  Text((results + fuel).toString())
                ],
              ),
              Row(
                children: [Text("Safe"), Text((results + fuel * 2).toString())],
              )
            ]),
          ),
          OutlinedButton(onPressed: oblicz, child: const Text('Calculate'))
        ],
      ),
    );
  }
}
