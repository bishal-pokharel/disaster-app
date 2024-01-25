// lib/disaster_alert_page.dart
// import 'dart:html';

import 'package:flutter/material.dart';

class DisasterAlertPage extends StatelessWidget {
  final List<String> notifications = [
    'Notification 11: Some place has a disaster.',
    'Notification 2: Another place is facing an emergency.',
    'Notification 3: Yet another location needs attention.',
    // Add more notifications as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disaster Alert Feature'),
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
                  'Disaster Alert',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Notification Buttons
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  child: MaterialButton(
                    onPressed: () {
                      // Handle button press, you can show a notification dialog or navigate to a new page
                      _showNotificationDialog(context, notifications[index]);
                    },
                    child: Text(
                      'Notification ${index + 1}',
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

  // Function to show a notification dialog
  void _showNotificationDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text(message),
          actions: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
