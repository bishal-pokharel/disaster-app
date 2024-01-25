// lib/disaster_alert_page.dart
import 'package:flutter/material.dart';
import 'full_screen_content_page.dart'; // Import the new full-screen content page

class EmergencyPreparednessPage extends StatelessWidget {
  final Map<String, Map<String, dynamic>> notificationContent = {
    'Guideline 1....': {
      'heading': 'Guideline 1',
      'paragraph': 'Description for Fire And Rescue',
      'list': ['Item 1', 'Item 2', 'Item 3'],
    },
    'Guideline 2....': {
      'heading': 'Guideline 2',
      'paragraph': 'Description for Paramedics',
      'list': ['Item A', 'Item B', 'Item C'],
    },
    'Guideline 3....': {
      'heading': 'Guideline 3',
      'paragraph': 'Description for Disaster Relief Force',
      'list': ['Item X', 'Item Y', 'Item Z'],
    },
    // Add more content as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Preparedness'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo and App Title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('assets/disaster_alert.png', width: 80, height: 80),
                SizedBox(height: 16),
                Text(
                  'Emergency Service',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Notification Buttons
          Expanded(
            child: ListView.builder(
              itemCount: notificationContent.length,
              itemBuilder: (context, index) {
                final notification = notificationContent.keys.elementAt(index);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigate to the FullScreenContentPage with the selected notification
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenContentPage(
                              content: notificationContent[notification]!),
                        ),
                      );
                    },
                    child: Text(
                      notification,
                      style: TextStyle(fontSize: 12),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
