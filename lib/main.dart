import 'dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/src/presentation/home/home_page.dart';
import 'package:practica1/src/presentation/home/cubit/home_cubit.dart';

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
      home: BlocProvider(
        create: (context) => locator<HomeCubit>()..fetchAllCharacters(),
        child: const HomePage(),
      ),
    );
  }
}
