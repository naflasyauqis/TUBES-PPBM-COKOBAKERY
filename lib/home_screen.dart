import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header dengan salam dan avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hi, Nafla! 👋',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/pp.jpeg'), // Avatar profil
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search recipes...',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Judul bagian daftar resep
              const Text(
                'Latest Recipes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Daftar resep (ListView)
              Expanded(
                child: ListView.builder(
                  itemCount: 2, // Jumlah resep
                  itemBuilder: (context, index) {
                    return _buildRecipeCard(
                      context,
                      title: index == 0
                          ? 'Chocolate Cake'
                          : 'Pancakes',
                      description: index == 0
                          ? 'A delicious chocolate cake perfect for all occasions.'
                          : 'Fluffy pancakes served with syrup and butter.',
                      imagePath: index == 0
                          ? 'assets/chocolate_cake.jpg'
                          : 'assets/pancakes.jpg',
                      ingredients: index == 0
                          ? '• 200g sugar\n• 1 cup flour\n• 2 eggs\n• 1/2 cup cocoa powder\n• 1 cup milk'
                          : '• 1 cup flour\n• 2 eggs\n• 1 cup milk\n• 1 tsp baking powder\n• 1 tbsp sugar',
                      instructions: index == 0
                          ? '1. Preheat oven to 180°C.\n2. Mix all ingredients.\n3. Bake for 30 minutes.\n4. Cool and frost.'
                          : '1. Mix all ingredients.\n2. Pour onto hot griddle.\n3. Cook until golden brown.\n4. Serve with syrup.',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget kartu resep
  Widget _buildRecipeCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imagePath,
    required String ingredients,
    required String instructions,
  }) {
    return GestureDetector(
      onTap: () {
        // Menampilkan bottom sheet dengan detail resep saat card ditekan
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar resep
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Judul resep
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Deskripsi resep
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Bahan-bahan
                  const Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ingredients,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Instruksi
                  const Text(
                    'Instructions:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    instructions,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            // Gambar resep
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),

            // Detail resep
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
