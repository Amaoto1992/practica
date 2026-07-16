import 'package:flutter/material.dart';
import 'package:practica1/dependency_injection.dart';
import 'package:practica1/src/presentation/home/home_page.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica',
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
