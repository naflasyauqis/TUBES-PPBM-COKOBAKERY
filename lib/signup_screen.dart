import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 255, 222, 191), Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IceCreamImage(), // Custom widget for consistency with the design
              const SizedBox(height: 20),
              const Text(
                'Create your account!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              const SizedBox(height: 30),
              const CustomInputField(hintText: 'Full Name', icon: Icons.person),
              const CustomInputField(hintText: 'someone@gmail.com', icon: Icons.email),
              const CustomInputField(hintText: 'Password', icon: Icons.lock, obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 222, 191),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  child: Text('Sign Up'),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: const Text('Already have an account? Sign In',
                    style: TextStyle(color: Colors.brown)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color.fromARGB(255, 115, 73, 59)),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class IceCreamImage extends StatelessWidget {
  const IceCreamImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Image.asset(
        'assets/cake.webp', // Add the ice cream image here
        fit: BoxFit.contain,
      ),
    );
  }
}
