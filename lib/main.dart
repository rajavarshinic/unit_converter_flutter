import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double input = 0;
  double output = 0;
  String fromUnit = "Kilometers";
  String toUnit = "Miles";

  final Map<String, double> conversionRates = {
    "Kilometers": 1.0,
    "Miles": 0.621371,
    "Meters": 1000.0,
    "Feet": 3280.84,
  };

  void convert() {
    setState(() {
      output = input * (conversionRates[toUnit]! / conversionRates[fromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("C.Rajavarshini's Unit Converter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Enter value"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  input = double.tryParse(value) ?? 0;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                  items:
                      conversionRates.keys
                          .map(
                            (unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            ),
                          )
                          .toList(),
                ),
                Text("to"),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                  items:
                      conversionRates.keys
                          .map(
                            (unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
            ElevatedButton(onPressed: convert, child: Text("Convert")),
            SizedBox(height: 20),
            Text(
              "Converted Value: $output",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
