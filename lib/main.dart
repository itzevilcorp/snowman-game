import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the SplashScreen widget

void main() {
  runApp(MyApp()); // Run the Flutter application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title', // Set your app title here
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set your app's primary color
      ),
      home: SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}
