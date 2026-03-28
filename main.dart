import 'package:flutter/material.dart';
import 'homepage.dart'; // Import the home page file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmMate App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}