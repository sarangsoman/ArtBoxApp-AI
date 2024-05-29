import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIGeneratorScreen extends StatefulWidget {
  const AIGeneratorScreen({super.key});

  @override
  _AIGeneratorScreenState createState() => _AIGeneratorScreenState();
}

class _AIGeneratorScreenState extends State<AIGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _imageUrl = '';

  Future<void> _generateImage() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/generate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'description': _controller.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _imageUrl = data['imageUrl'];
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('Error: $e');
      // Handle any errors here, such as showing a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to generate image'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Describe your tattoo design',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateImage,
              child: const Text('Generate'),
            ),
            const SizedBox(height: 20),
            _imageUrl.isNotEmpty
                ? Image.network(_imageUrl)
                : Container(),
          ],
        ),
      ),
    );
  }
}
