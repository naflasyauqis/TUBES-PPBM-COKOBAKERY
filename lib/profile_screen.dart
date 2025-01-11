import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Profile picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/pp.jpeg'), // Add your profile image here
              ),
            ),
            const SizedBox(height: 20),
            // User's name
            const Text(
              'Nafla',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 5),
            // User's email
            const Text(
              'nafla@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Profile action buttons
            Expanded(
              child: ListView(
                children: [
                  ProfileOption(
                    icon: Icons.edit,
                    title: 'Edit Profil',
                    onTap: () {
                      // Add functionality
                    },
                  ),
                  ProfileOption(
                    icon: Icons.settings,
                    title: 'Pengaturan',
                    onTap: () {
                      // Add functionality
                    },
                  ),
                  ProfileOption(
                    icon: Icons.history,
                    title: 'Riwayat Pembelian',
                    onTap: () {
                      // Add functionality
                    },
                  ),
                  ProfileOption(
                    icon: Icons.help,
                    title: 'Bantuan',
                    onTap: () {
                      // Add functionality
                    },
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    title: 'Keluar',
                    onTap: () {
                      // Add functionality
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Floating Action Button for chat
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for chat input
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Masukan Chat'),
                content: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Tulis pesan Anda di sini...',
                  ),
                  maxLines: 3,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Kirim'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.brown,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.brown,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
      onTap: onTap,
    );
  }
}
