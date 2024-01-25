// lib/login_page.dart
import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Import your dashboard page file

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // String username = "YourUsername";

  bool _isLoginForm = true; // Default to login form

  void _toggleForm() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validation successful, handle login or sign-up logic here
      if (_isLoginForm) {
        if (_usernameController.text == 'hello' &&
            _passwordController.text == 'world') {
          // If login successful, navigate to dashboard
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DashboardPage(username: _usernameController.text)),
          );
        } else {
          // Handle incorrect login credentials
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Incorrect username or password'),
            ),
          );
        }
      } else {
        // Handle sign-up
        print(
            'Signing up with username: ${_usernameController.text}, password: ${_passwordController.text}, confirm password: ${_confirmPasswordController.text}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              if (!_isLoginForm) SizedBox(height: 16),
              if (!_isLoginForm)
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(_isLoginForm ? 'Login' : 'Sign Up'),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: _toggleForm,
                child: Text(_isLoginForm
                    ? 'Don\'t have an account? Sign Up'
                    : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
