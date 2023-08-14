import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var myController = TextEditingController();
  int a = 0;
  void oblicz() {
    setState(() {
      a = (int.parse(myController.text) + 5);
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
          Container(
            child: TextField(
              decoration: const InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              controller: myController,
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFFD1E4FF)),
            width: double.infinity,
            child: Column(children: [
              Row(
                children: [Text("Minimalna ilość paliwa"), Text(a.toString())],
              ),
              Row(
                children: [
                  Text("Rekomendowana ilość paliwa"),
                  Text(myController.text)
                ],
              ),
              Row(
                children: [
                  Text("Rekomendowana ilość paliwa"),
                  Text(myController.text)
                ],
              )
            ]),
          ),
          OutlinedButton(onPressed: oblicz, child: const Text('Calculate'))
        ],
      ),
    );
  }
}
