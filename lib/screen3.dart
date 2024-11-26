import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _result = '';

  void _calculateInterest() {
    final principal = double.tryParse(_principalController.text) ?? 0;
    final rate = double.tryParse(_rateController.text) ?? 0;
    final time = double.tryParse(_timeController.text) ?? 0;

    setState(() {
      if (principal > 0 && rate > 0 && time > 0) {
        final interest = (principal * rate * time) / 100;
        _result = 'Simple Interest: $interest';
      } else {
        _result = 'Please enter valid values';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _principalController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter principal amount'),
            ),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter rate of interest'),
            ),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter time (years)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateInterest,
              child: const Text('Calculate Interest'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}