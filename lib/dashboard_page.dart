// lib/dashboard_page.dart
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  // Constructor to receive the username
  DashboardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildProfileSection(),
          // Profile
          buildDashboardItem('My Profile', Icons.person, () {
            // Handle My Profile button press
            // You can navigate to a dedicated profile page or show a dialog, etc.
            print('My Profile pressed');
          }),
          // Terms and Conditions
          buildDashboardItem('Terms and Conditions', Icons.description, () {
            // Handle Terms and Conditions button press
            // You can navigate to a dedicated terms page or show a dialog, etc.
            print('Terms and Conditions pressed');
          }),
          // Settings
          buildDashboardItem('Settings', Icons.settings, () {
            // Handle Settings button press
            // You can navigate to a dedicated settings page or show a dialog, etc.
            print('Settings pressed');
          }),
          // Logout
          buildDashboardItem('Logout', Icons.exit_to_app, () {
            // Handle Logout button press
            // You can navigate to the login page or show a dialog to confirm logout, etc.
            print('Logout pressed');
          }),
        ],
      ),
    );
  }

  Widget buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            // Display a profile icon (you can replace this with your icon)
            child: Icon(Icons.person),
            radius: 40,
          ),
          SizedBox(height: 30),
          // Display the username
          Text(
            'Welcome, $username!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildDashboardItem(
      String title, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(title),
      ),
    );
  }
}
