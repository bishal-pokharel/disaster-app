// full_screen_content_page.dart
import 'package:flutter/material.dart';

class FullScreenContentPage extends StatelessWidget {
  final Map<String, dynamic> content;

  FullScreenContentPage({required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(content['heading'] ?? 'Content'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              content['heading'] ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content['paragraph'] ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            if (content['list'] != null)
              for (var item in content['list']) Text('• $item'),
          ],
        ),
      ),
    );
  }
}
