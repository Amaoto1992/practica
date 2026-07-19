import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/src/presentation/home/cubit/home_cubit.dart';
import 'package:practica1/src/presentation/home/cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => switch (state) {
              InitialState() => Scaffold(
                  appBar: AppBar(
                    title: const Text('Práctica'),
                    centerTitle: true,
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<HomeCubit>().fetchAllCharacters();
                      },
                      child: Text('Cargar datos'),
                    ),
                  ),
                ),
              LoadingState() => Scaffold(
                  appBar: AppBar(
                    title: const Text('Práctica'),
                    centerTitle: true,
                  ),
                  body: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ErrorState(:final message) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Práctica'),
                    centerTitle: true,
                  ),
                  body: Center(
                    child: Text('Error al cargar los datos $message'),
                  ),
                ),
              LoadedState(:final characters) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Práctica'),
                    centerTitle: true,
                  ),
                  body: ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (context, index) {
                      final character = characters[index];
                      return ListTile(
                        title: Text(character.id.toString()),
                        subtitle: Text(character.name),
                        leading: Image.network(character.image),
                      );
                    },
                  ),
                ),
            });
  }
}
