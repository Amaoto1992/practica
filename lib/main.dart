import 'package:flutter/material.dart';
import 'package:practica1/dependency_injection.dart';
import 'package:practica1/src/presentation/home/home_page.dart';

void main() {
  setUpLocator();
  runApp(const OnePiece());
}

class OnePiece extends StatelessWidget {
  const OnePiece({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Piece App',
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
