import 'package:flutter/material.dart';

class WeightCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController kgController = TextEditingController();
    final TextEditingController gramController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Berat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: kgController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Kilogram (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: gramController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Gram (g)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double kg = double.tryParse(kgController.text) ?? 0.0;
                double gram = double.tryParse(gramController.text) ?? 0.0;
                double totalGram = (kg * 1000) + gram;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Hasil Konversi'),
                    content: Text('Total Berat: $totalGram gram'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Hitung Berat'),
            ),
          ],
        ),
      ),
    );
  }
}
