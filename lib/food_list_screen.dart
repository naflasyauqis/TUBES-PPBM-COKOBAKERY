import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bakery App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const FoodListScreen(),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Desserts'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          foodItem(
            context,
            'Kukis Coklat',
            'assets/kukis.jpg',
            'Kukis coklat yang renyah dan lezat. Cocok untuk cemilan sehari-hari.',
            350,
          ),
          foodItem(
            context,
            'Red Velvet Cake',
            'assets/red_velvet.jpg',
            'Red Velvet Cake lembut dengan cream cheese frosting.',
            450,
          ),
          foodItem(
            context,
            'Roti Manis',
            'assets/roti.jpg',
            'Roti manis yang lembut dengan isi cokelat.',
            250,
          ),
          foodItem(
            context,
            'Es Krim Vanila',
            'assets/eskrim.jpg',
            'Es krim vanilla yang menyegarkan dengan tekstur lembut.',
            200,
          ),
        ],
      ),
    );
  }

  Widget foodItem(
      BuildContext context, String name, String imagePath, String description, int calories) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Calories: $calories kcal'),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text('Calories: $calories kcal'),
                    const SizedBox(height: 10),
                    Text(description),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
