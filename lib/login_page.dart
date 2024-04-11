import 'package:flutter/material.dart';
import 'snowman_game_page.dart'; // Import the SnowmanGamePage to navigate to after successful login

class LoginPage extends StatelessWidget {
  // Controller for the text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username text field
            TextFormField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white), // Set label color to white
              ),
            ),
            SizedBox(height: 20),
            // Password text field
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white), // Set label color to white
              ),
            ),
            SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: () {
                // Implement login logic here
                String username = _usernameController.text;
                String password = _passwordController.text;

                // For now, navigate to SnowmanGamePage directly
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SnowmanGamePage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green), // Set button background color
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black, // Set background color to black
    );
  }
}
