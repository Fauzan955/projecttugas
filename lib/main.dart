import 'package:flutter/material.dart';
import 'welcome_page.dart';

void main() {
  runApp(const FutsalRegistrationApp());
}

class FutsalRegistrationApp extends StatelessWidget {
  const FutsalRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turnamen Futsal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomePage(), 
    );
  }
}
