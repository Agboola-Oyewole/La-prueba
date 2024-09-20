import 'package:flutter/material.dart';
import 'package:la_prueba/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Lato', // Set your custom font family here
    ),
    home: const HomeScreen(),
  ));
}
