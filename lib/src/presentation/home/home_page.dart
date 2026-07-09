import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/dependency_injection.dart';
import 'package:practica1/src/presentation/detail/detail_page.dart';
import 'package:practica1/src/presentation/home/cubit/home_cubit.dart';
import 'package:practica1/src/presentation/home/cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getAllCharacters(),
      child: Scaffold(
        appBar: AppBar(title: Text('One Piece'), centerTitle: true),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder:
              (context, state) => switch (state) {
                InitialState() => Center(child: Text('One Piece App')),
                LoadingState() => Center(child: CircularProgressIndicator()),
                ErrorState(:final message) => Center(
                  child: Text('Problems with the App $message'),
                ),
                LoadedState(:final characters) => ListView.builder(
                  itemCount: characters.length,
                  itemBuilder:
                      (context, index) => ListTile(
                        title: Text(characters[index].name.romaji),
                        leading: characters[index].imageUrl != null
                                ? Image.network(characters[index].imageUrl!)
                                : null,
                        subtitle: Text(characters[index].status),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                DetailPage(id: characters[index].id),
                          ),
                        ),
                      ),
                ),
              },
        ),
      ),
    );
  }
}
