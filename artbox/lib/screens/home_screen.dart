import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Artbox'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ai-generator');
              },
              child: const Text('AI Generator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gallery');
              },
              child: const Text('Gallery'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
