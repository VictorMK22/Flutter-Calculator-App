import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calc App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CalculatorApp(title: 'Calculator App'));
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key, required this.title});

  final String title;

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  int _result = 0;

  void addition() {
    setState(() {
      _result =
          int.parse(_num1Controller.text) + int.parse(_num2Controller.text);
    });
  }

  void subtract() {
    setState(() {
      _result =
          int.parse(_num1Controller.text) - int.parse(_num2Controller.text);
    });
  }

  void multiplication() {
    setState(() {
      _result =
          int.parse(_num1Controller.text) * int.parse(_num2Controller.text);
    });
  }

  void division() {
    setState(() {
      // Ensure both inputs are not empty
      if (_num1Controller.text.isNotEmpty && _num2Controller.text.isNotEmpty) {
        try {
          // Parse both numbers as integers
          int num1 =
              int.parse(_num1Controller.text); // num1 should be an integer
          int num2 =
              int.parse(_num2Controller.text); // num2 should be an integer

          // Check if num2 is not zero
          if (num2 != 0) {
            // Perform integer division
            _result = num1 ~/ num2; // Integer division, no decimal places
          } else {
            // Handle division by zero
            _result = 0;
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Error: Division by zero is not allowed")));
          }
        } catch (e) {
          // Handle any parsing errors (invalid input)
          _result = 0;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Error: Please enter valid numbers")));
        }
      } else {
        // Handle empty input fields
        _result = 0;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error: Please fill in both fields")));
      }
    });
  }

  void clear() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Input fields
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter first number'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter second number'),
            ),
            const SizedBox(height: 20),

            // Result display
            Text(
              'Result: $_result',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: addition,
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: subtract,
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: division,
                  child: Text('÷', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: multiplication,
                  child: const Icon(Icons.close),
                ),
                ElevatedButton(
                  onPressed: clear,
                  child: const Text("Clear"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
