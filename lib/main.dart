import 'package:eduwebsite/scrrens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NavkarEducationApp());
}

class NavkarEducationApp extends StatelessWidget {
  const NavkarEducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navkar Education',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Roboto'),
      home: const SplashScreen(),
    );
  }
}
