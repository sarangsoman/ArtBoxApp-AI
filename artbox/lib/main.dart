import 'package:flutter/material.dart';
import 'package:artbox/screens/profile_screen.dart';
import 'screens/home_screen.dart';
import 'screens/ai_generator_screen.dart';
import 'screens/gallery_screen.dart';

void main() {
  runApp(ArtBoxApp());
}

class ArtBoxApp extends StatelessWidget {
  const ArtBoxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/ai-generator': (context) => const AIGeneratorScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
